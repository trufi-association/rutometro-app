import 'package:flutter/material.dart';
import 'package:trufi_core/base/blocs/providers/city_selection_manager.dart';

/// Banner shown in the drawer header when the active city has no banner of
/// its own, and in place of a city banner that fails to load.
const String defaultCityBannerAsset = 'assets/images/drawer-bg.jpg';

/// Drawer banner of each city.
///
/// Adding or replacing a banner is dropping `assets/images/drawer-bg-<city>.jpg`
/// (same size as the generic one, 776x516) and listing it here; a city that is
/// not listed keeps [defaultCityBannerAsset].
const Map<CityInstance, String> cityBannerAssets = {
  CityInstance.zitacuaro: 'assets/images/drawer-bg-zitacuaro.jpg',
  CityInstance.zamora: 'assets/images/drawer-bg-zamora.jpg',
  CityInstance.uruapan: 'assets/images/drawer-bg-uruapan.jpg',
  CityInstance.salinaCruz: 'assets/images/drawer-bg-salinaCruz.jpg',
  CityInstance.oaxaca: 'assets/images/drawer-bg-oaxaca.jpg',
  CityInstance.toluca: 'assets/images/drawer-bg-toluca.jpg',
  CityInstance.jilotepec: 'assets/images/drawer-bg-jilotepec.jpg',
  CityInstance.puertoEscondido: 'assets/images/drawer-bg-puertoEscondido.jpg',
};

/// The banner asset of [city], or the generic one when it has none.
String cityBannerAssetFor(
  CityInstance city, {
  Map<CityInstance, String> banners = cityBannerAssets,
}) =>
    banners[city] ?? defaultCityBannerAsset;

/// Drawer header image for the city selected in [CitySelectionManager].
///
/// Meant as the drawer's `backgroundImageBuilder`: the drawer is built every
/// time it opens, so the banner follows the city picked in its header.
Widget buildCityBanner(BuildContext context) =>
    cityBannerImage(cityBannerAssetFor(CitySelectionManager().currentCity));

/// [asset] cover-fitted into the header. If it cannot be loaded, the generic
/// banner takes its place instead of the framework's error box.
Widget cityBannerImage(String asset) {
  return Image.asset(
    asset,
    fit: BoxFit.cover,
    errorBuilder: asset == defaultCityBannerAsset
        ? null
        : (context, error, stackTrace) =>
            Image.asset(defaultCityBannerAsset, fit: BoxFit.cover),
  );
}
