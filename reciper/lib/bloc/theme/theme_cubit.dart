import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reciper/model/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool get isLight => state.themeMode == ThemeMode.light;
  bool get isDark => state.themeMode == ThemeMode.dark;
  ThemeCubit()
      : super(ThemeState(ThemeMode.light, ThemeModel.fromKey("Sky"), 16)) {
    getPreferences();
  }

  void getPreferences() async { // Get the theme mode, theme key and font size from shared preferences.
    var preferences = await SharedPreferences.getInstance();
    final isLight = preferences.getString('THEME_MODE') == 'light'; // Tema modunu al
    final themeKey = preferences.getString('THEME_KEY') ?? "Sky"; // Tema anahtarını al
    final int fontSize = preferences.getInt('FONT_SIZE') ?? 16;
    emit(ThemeState(isLight ? ThemeMode.light : ThemeMode.dark,
        ThemeModel.fromKey(themeKey), fontSize));
  }

  void toggleTheme() async { // Tema modunu değiştir
    var preferences = await SharedPreferences.getInstance();
    final isLight = state.themeMode == ThemeMode.light;
    final newThemeMode = isLight ? ThemeMode.dark : ThemeMode.light;
    preferences.setString('THEME_MODE', newThemeMode.toString());
    emit(ThemeState(newThemeMode, state.theme, state.fontSize));
  }

  void changeTheme(ThemeModel themeModel) async { // Temayı değiştir
    var preferences = await SharedPreferences.getInstance();
    preferences.setString('THEME_KEY', themeModel.name);
    emit(ThemeState(
        state.themeMode, ThemeModel.fromKey(themeModel.name), state.fontSize));
  }

  void changeFontSize(int fontSize) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setInt('FONT_SIZE', fontSize);
    emit(ThemeState(state.themeMode, state.theme, fontSize));
  }

  void resetTheme() async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setString('THEME_MODE', 'light');
    preferences.setString('THEME_KEY', 'Sky');
    preferences.setInt('FONT_SIZE', 16);
    emit(ThemeState(ThemeMode.light, ThemeModel.fromKey("Sky"), 16));
  }
}
