import 'package:flutter/material.dart';
import 'package:rutometro/branding_rutometro.dart';
import 'package:rutometro/custom_async_executor.dart';
import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/blocs/map_tile_provider/map_tile_provider.dart';
import 'package:trufi_core/base/blocs/theme/theme_cubit.dart';
import 'package:trufi_core/base/models/trufi_latlng.dart';
import 'package:trufi_core/base/utils/graphql_client/hive_init.dart';
import 'package:trufi_core/base/utils/trufi_app_id.dart';
import 'package:trufi_core/base/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi_core/base/widgets/screen/lifecycle_reactor_notification.dart';
import 'package:trufi_core/default_values.dart';
import 'package:trufi_core/trufi_core.dart';
import 'package:trufi_core/trufi_router.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await TrufiAppId.initialize();
  runApp(
    TrufiApp(
      appNameTitle: 'Rutometro',
      trufiLocalization: DefaultValues.trufiLocalization(
        currentLocale: const Locale("es"),
      ),
      trufiBaseTheme: TrufiBaseTheme(
        themeMode: ThemeMode.light,
        brightness: Brightness.light,
        theme: brandingRutometro,
        darkTheme: brandingRutometroDark,
      ),
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://rutometro.trufi.dev/otp",
          otpGraphqlEndpoint: "https://rutometro.trufi.dev/otp/index/graphql",
          mapConfiguration: MapConfiguration(
            center: const TrufiLatLng(19.4323039, -100.3554035),
          ),
          searchAssetPath: "assets/data/search.json",
          photonUrl: "https://rutometro.trufi.dev/photon",
          mapTileProviders: [
            OSMMapLayer(
              mapTilesUrl:
                  "https://rutometro.trufi.dev/static-maps/osm-liberty/{z}/{x}/{y}@2x.jpg",
            )
          ],
        ),
      ],
      trufiRouter: TrufiRouter(
        routerDelegate: DefaultValues.routerDelegate(
          appName: 'Rutometro',
          cityName: 'Michoacán',
          countryName: 'Mexico',
          backgroundImageBuilder: (_) {
            return Image.asset(
              'assets/images/drawer-bg.jpg',
              fit: BoxFit.cover,
            );
          },
          urlFeedback:
              'https://trufifeedback.z15.web.core.windows.net/route.html',
          emailContact: 'leonardo.gutierrez@trufi-association.org',
          urlShareApp: 'https://www.trufi.app/',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://www.facebook.com/trufiapp/',
          ),
          shareBaseUri: Uri(
            scheme: "https",
            host: "rutometro.trufi.dev",
          ),
          lifecycleReactorHandler: LifecycleReactorNotifications(
            url: 'https://rutometro.trufi.dev/static_files/notification.json',
          ),
          asyncExecutor: customAsyncExecutor,
        ),
      ),
    ),
  );
}
