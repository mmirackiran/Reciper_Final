// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flag/flag.dart';

class LanguageModel {
  final String name;
  final Flag flag;
  final String code;
  LanguageModel({
    required this.name,
    required this.flag,
    required this.code,
  });

  String get countryCode => code.toUpperCase();

  LanguageModel copyWith({
    String? name,
    Flag? flag,
    String? code,
  }) {
    return LanguageModel(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      name: map['name'] as String,
      flag: Flag.fromString((map['code'] as String).toUpperCase()),
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromJson(String source) =>
      LanguageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LanguageModel(name: $name, flag: $flag, code: $code)';

  @override
  bool operator ==(covariant LanguageModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.flag == flag && other.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ flag.hashCode ^ code.hashCode;
}
