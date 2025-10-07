import 'dart:convert';
import 'package:flutter/services.dart';

import 'poi_layer_data.dart';

Future<List<POILayerData>> markersFromAssets(String path) async {
  final List<POILayerData> markers = [];
  final body = await rootBundle.loadString(path).then(
        (jsonStr) => jsonDecode(jsonStr),
      );
  final List features = body["features"] as List;
  for (final feature in features) {
    final properties = feature["properties"];
    final geometry = Geometry.fromJson(feature["geometry"]);
    if (geometry.coordinates.isNotEmpty) {
      if (properties["nombre"] is String) {
        markers.add(POILayerData(
          id: properties["@id"] as String?,
          geometry: geometry,
          name: (properties["nombre"] as String?) ?? "",
          nameEn: properties["name_en"] as String?,
          nameDe: properties["name_de"] as String?,
          popupContent: properties["popupContent"] as String?,
          popupContentEn: properties["popupContent_en"] as String?,
          popupContentDe: properties["popupContent_de"] as String?,
        ));
      }
    }
  }
  return markers;
}
