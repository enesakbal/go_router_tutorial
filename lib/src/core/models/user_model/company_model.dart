import 'dart:convert';

class CompanyModel {
  CompanyModel({this.name, this.catchPhrase, this.bs});

  factory CompanyModel.fromMap(Map<String, dynamic> data) => CompanyModel(
        name: data['name'] as String?,
        catchPhrase: data['catchPhrase'] as String?,
        bs: data['bs'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CompanyModel].
  factory CompanyModel.fromJson(String data) {
    return CompanyModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? name;
  String? catchPhrase;
  String? bs;

  Map<String, dynamic> toMap() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  /// `dart:convert`
  ///
  /// Converts [CompanyModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
