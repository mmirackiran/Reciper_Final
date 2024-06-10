// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RecipeModel {
  final String name;
  final String cuisine;
  final String description;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;
  RecipeModel({
    required this.name,
    required this.cuisine,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  RecipeModel copyWith({
    String? name,
    String? cuisine,
    String? description,
    String? image,
    List<String>? ingredients,
    List<String>? instructions,
  }) {
    return RecipeModel(
      name: name ?? this.name,
      cuisine: cuisine ?? this.cuisine,
      description: description ?? this.description,
      image: image ?? this.image,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cuisine': cuisine,
      'description': description,
      'image': image,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      name: map['name'] as String,
      cuisine: map['cuisine'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      ingredients: List<String>.from((map['ingredients'] as List<dynamic>)),
      instructions: List<String>.from((map['instructions'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeModel(name: $name, cuisine: $cuisine, description: $description, image: $image, ingredients: $ingredients, instructions: $instructions)';
  }

  @override
  bool operator ==(covariant RecipeModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.cuisine == cuisine &&
        other.description == description &&
        other.image == image &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.instructions, instructions);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cuisine.hashCode ^
        description.hashCode ^
        image.hashCode ^
        ingredients.hashCode ^
        instructions.hashCode;
  }
}
