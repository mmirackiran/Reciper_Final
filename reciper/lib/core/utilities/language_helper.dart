import 'package:flag/flag.dart';
import 'package:reciper/model/language_model.dart';

class LanguageHelper {
  static LanguageModel getLanguageFromCode(String languageCode) {
    switch (languageCode) {
      case "en":
        return LanguageModel(
            name: "English", flag: Flag.fromCode(FlagsCode.US), code: "en");
      case "tr":
        return LanguageModel(
            name: "Türkçe", flag: Flag.fromCode(FlagsCode.TR), code: "tr");
      case "es":
        return LanguageModel(
            name: "Español", flag: Flag.fromCode(FlagsCode.ES), code: "es");
      case "de":
        return LanguageModel(
            name: "Deutsch", flag: Flag.fromCode(FlagsCode.DE), code: "de");
      default:
        return LanguageModel(
            name: "English", flag: Flag.fromCode(FlagsCode.US), code: "en");
    }
  }
}
