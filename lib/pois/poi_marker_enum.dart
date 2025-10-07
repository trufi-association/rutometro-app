import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rutometro_app/pois/icons.dart';
import 'package:trufi_core/base/translations/trufi_base_localizations.dart';

enum POILayerIds {
  busStops,
}

extension LayerIdsToString on POILayerIds {
  static final Map<POILayerIds, String> _enumStrings = {
    POILayerIds.busStops: "LayerIds.busStops",
  };

  static final Map<POILayerIds, String> _layerFileNames = {
    POILayerIds.busStops: "stops.geojson",
  };

  static String? _translates(
      POILayerIds enumData, TrufiBaseLocalization localization) {
    return {
      POILayerIds.busStops: localization.busStops,
    }[enumData];
  }

  static Widget? _images(POILayerIds transportMode, Color? color) {
    switch (transportMode) {
      case POILayerIds.busStops:
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.string(busStopIcon),
        );
      default:
        return null;
    }
  }

  static final Map<POILayerIds, Color> _colors = {
    POILayerIds.busStops: Colors.white,
  };

  static final Map<POILayerIds, Color> _backgroundColors = {
    POILayerIds.busStops: const Color(0xFF67AD5B),
  };
  static final Map<POILayerIds, double> _circularRadius = {
    POILayerIds.busStops: 20,
  };

  String getTranslate(TrufiBaseLocalization localization) =>
      _translates(this, localization) ?? 'LayerIds type not found';

  Color get getColor => _colors[this] ?? Colors.red;

  Color get getBackgroundColor => _backgroundColors[this] ?? Colors.red;

  String get getString => _enumStrings[this] ?? '';

  String get getFileName => _layerFileNames[this] ?? '';

  Widget getImage({Color? color, double size = 24}) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all((_circularRadius[this] ?? 5) > 10 ? 3 : 2),
      decoration: BoxDecoration(
        color: _backgroundColors[this],
        borderRadius: BorderRadius.circular(_circularRadius[this] ?? 5),
        border: Border.all(
          color: color ?? _colors[this] ?? Colors.transparent,
          width: 0.7,
        ),
      ),
      child: FittedBox(
        child: _images(this, color ?? _colors[this]) ??
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
      ),
    );
  }
}
