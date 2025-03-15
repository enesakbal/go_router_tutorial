import 'dart:convert';

import 'geo_model.dart';

class AddressModel {
  AddressModel({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        street: data['street'] as String?,
        suite: data['suite'] as String?,
        city: data['city'] as String?,
        zipcode: data['zipcode'] as String?,
        geo: data['geo'] == null ? null : GeoModel.fromMap(data['geo'] as Map<String, dynamic>),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressModel].
  factory AddressModel.fromJson(String data) {
    return AddressModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  Map<String, dynamic> toMap() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [AddressModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
