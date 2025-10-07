import 'package:flutter/material.dart';
import 'package:rutometro_app/pois/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rutometro_app/pois/poi_layer.dart';
import 'package:rutometro_app/pois/poi_marker_enum.dart';

import 'package:trufi_core/base/blocs/map_layer/map_layer.dart';
import 'package:trufi_core/base/translations/trufi_base_localizations.dart';

final List<MapLayerContainer> customLayersRutometro = [
  MapLayerContainer(
    name: (context) => TrufiBaseLocalization.of(context).stops,
    icon: (context) => Container(child: SvgPicture.string(stop),),
    layers: [
      POILayer(
        POILayerIds.busStops,
        '3',
      ),
    ],
  ),
];
