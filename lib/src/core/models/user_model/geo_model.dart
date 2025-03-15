import 'dart:convert';

class GeoModel {
  GeoModel({this.lat, this.lng});

  factory GeoModel.fromMap(Map<String, dynamic> data) => GeoModel(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeoModel].
  factory GeoModel.fromJson(String data) {
    return GeoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? lat;
  String? lng;

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lng': lng,
      };

  /// `dart:convert`
  ///
  /// Converts [GeoModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
