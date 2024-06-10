import 'package:flutter/material.dart';
import 'package:reciper/constants/app_constants.dart';

List<ThemeModel> _themes = [
  ThemeModel(
    name: 'Main',
    lightTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.mainColor),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstants.mainColor, brightness: Brightness.dark),
      useMaterial3: true,
    ),
  ),
  ThemeModel(
    name: 'Magic',
    lightTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.magicColor),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstants.magicColor, brightness: Brightness.dark),
      useMaterial3: true,
    ),
  ),
  ThemeModel(
    name: 'Jungle',
    lightTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.jungleColor),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstants.jungleColor, brightness: Brightness.dark),
      useMaterial3: true,
    ),
  ),
  ThemeModel(
      name: 'Beach',
      lightTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.beachColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.beachColor, brightness: Brightness.dark),
        useMaterial3: true,
      )),
];

class ThemeModel {
  final String name;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  ThemeModel(
      {required this.name, required this.lightTheme, required this.darkTheme});

  static List<ThemeModel> get themes => _themes;

  factory ThemeModel.fromKey(String themeKey) {
    return _themes.where((element) => element.name == themeKey).isEmpty
        ? _themes.first
        : _themes.where((element) => element.name == themeKey).first;
  }
}
