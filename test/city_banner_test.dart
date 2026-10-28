import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:rutometro_app/city_banner.dart';
import 'package:trufi_core/base/blocs/providers/city_selection_manager.dart';
import 'package:trufi_core/base/widgets/drawer/trufi_drawer.dart';

void main() {
  group('cityBannerAssetFor', () {
    test('a city with a banner gets its own asset', () {
      for (final entry in cityBannerAssets.entries) {
        expect(cityBannerAssetFor(entry.key), entry.value);
        expect(
          entry.value,
          'assets/images/drawer-bg-${entry.key.toValue()}.jpg',
          reason: 'banner files are named after CityInstance.toValue()',
        );
      }
    });

    test('every CityInstance has a banner of its own', () {
      expect(
        cityBannerAssets.keys.toSet(),
        CityInstance.values.toSet(),
        reason: 'a city without a banner silently shows the generic photo '
            '(rutometro#18)',
      );
    });

    test('a city without a banner falls back to the generic one', () {
      expect(
        cityBannerAssetFor(CityInstance.zamora, banners: const {}),
        defaultCityBannerAsset,
      );
      expect(
        cityBannerAssetFor(
          CityInstance.zamora,
          banners: const {
            CityInstance.oaxaca: 'assets/images/drawer-bg-oaxaca.jpg',
          },
        ),
        defaultCityBannerAsset,
      );
    });

    testWidgets('every listed banner is in the asset bundle', (tester) async {
      final manifest = await tester.runAsync(
        () => AssetManifest.loadFromAssetBundle(rootBundle),
      );
      final assets = manifest!.listAssets();
      for (final asset in [
        defaultCityBannerAsset,
        ...cityBannerAssets.values
      ]) {
        expect(
          assets,
          contains(asset),
          reason: '$asset is not declared in pubspec.yaml',
        );
      }
    });
  });

  group('buildCityBanner inside TrufiDrawer', () {
    const inAppReviewChannel = MethodChannel('dev.britannio.in_app_review');
    late Directory hiveDir;

    setUpAll(() async {
      // CitySelectionManager() opens its Hive box on construction.
      hiveDir = await Directory.systemTemp.createTemp('rutometro-city-banner-');
      Hive.init(hiveDir.path);
      await Hive.openBox(CitySelectionManagerHiveLocalRepository.path);
    });

    tearDownAll(() async {
      await Hive.close();
      await hiveDir.delete(recursive: true);
    });

    setUp(() {
      // The drawer header asks in_app_review whether a review is available.
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(inAppReviewChannel, (_) async => false);
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(inAppReviewChannel, null);
    });

    testWidgets('shows the banner of the active city and follows a city change',
        (tester) async {
      await tester.runAsync(
        () => CitySelectionManager().assignCity(CityInstance.zitacuaro),
      );
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: const TrufiDrawer(
              'home',
              appName: 'Rutometro',
              cityName: 'Michoacán',
              // The test font renders every glyph 1 em wide, so the real
              // 'Mexico' label would overflow the 240 px header row here.
              countryName: 'MX',
              backgroundImageBuilder: buildCityBanner,
              urlShareApp: 'https://www.trufi.app/',
              menuItems: [],
            ),
          ),
        ),
      );
      // Closed drawer: nothing of it is built, so nothing is cached either.
      expect(find.byType(TrufiDrawer), findsNothing);

      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();
      expect(_imageAssets(tester), ['assets/images/drawer-bg-zitacuaro.jpg']);

      scaffoldKey.currentState!.closeDrawer();
      await tester.pumpAndSettle();
      expect(find.byType(TrufiDrawer), findsNothing);

      await tester.runAsync(
        () => CitySelectionManager().assignCity(CityInstance.oaxaca),
      );
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();
      expect(_imageAssets(tester), ['assets/images/drawer-bg-oaxaca.jpg']);
    });

    testWidgets('a banner that fails to load is replaced by the generic one',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: cityBannerImage('assets/images/drawer-bg-missing.jpg'),
          ),
        );
        // Wait, bounded, for the lookup to really fail in the bundle and
        // for errorBuilder to put the generic banner in the tree.
        for (var i = 0; i < 100 && _imageAssets(tester).length < 2; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 10));
          await tester.pump();
        }
      });
      expect(
        _imageAssets(tester),
        ['assets/images/drawer-bg-missing.jpg', defaultCityBannerAsset],
      );
    });
  });
}

/// Asset names of every [Image] in the tree, outermost first.
List<String> _imageAssets(WidgetTester tester) => tester
    .widgetList<Image>(find.byType(Image))
    .map((image) => (image.image as AssetImage).assetName)
    .toList();
