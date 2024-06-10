import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(locale: Locale('en')));

  void selectLanguage(Locale locale) {
    emit(LanguageState(locale: locale));
  }
}
