import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reciper/model/theme_model.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final ThemeModel theme;
  final int fontSize;

  const ThemeState(this.themeMode, this.theme, this.fontSize);

  @override
  List<Object?> get props => [themeMode, theme];
}
