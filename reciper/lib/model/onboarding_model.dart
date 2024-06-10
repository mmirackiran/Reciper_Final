// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reciper/gen/assets.gen.dart';


class OnboardingModel {
  final AssetGenImage image;
  final List<TextSpan> titleSpan;
  final String description;
  OnboardingModel({
    required this.image,
    required this.titleSpan,
    required this.description,
  });

  OnboardingModel copyWith({
    AssetGenImage? image,
    List<TextSpan>? titleSpan,
    String? description,
  }) {
    return OnboardingModel(
      image: image ?? this.image,
      titleSpan: titleSpan ?? this.titleSpan,
      description: description ?? this.description,
    );
  }

  @override
  String toString() =>
      'OnboardingModel(image: $image, titleSpan: $titleSpan, description: $description)';

  @override
  bool operator ==(covariant OnboardingModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        listEquals(other.titleSpan, titleSpan) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      image.hashCode ^ titleSpan.hashCode ^ description.hashCode;


}
