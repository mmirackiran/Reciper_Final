import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reciper/bloc/language/language_cubit.dart';
import 'package:reciper/bloc/language/language_state.dart';
import 'package:reciper/bloc/recipe/recipe_cubit.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/core/utilities/language_helper.dart';
import 'package:reciper/model/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectBottomSheet extends StatelessWidget {
  const LanguageSelectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildLanguageItem(Locale locale, bool isSelected) {
      // Dil seçim widget'ı
      final LanguageModel language =
          LanguageHelper.getLanguageFromCode(locale.languageCode);
      return ListTile(
        leading: CircleAvatar(
            child: Padding(
                padding: const EdgeInsets.all(8), child: language.flag)),
        title: Text(language.name),
        trailing: isSelected
            ? const Icon(
                Icons.check,
              )
            : null,
        onTap: () {
          BlocProvider.of<LanguageCubit>(context).selectLanguage(locale);
          BlocProvider.of<RecipeCubit>(context)
              .initRecipes(locale.languageCode);
          Navigator.pop(context);
        },
      );
    }

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    context.translate.language_selection,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ...AppLocalizations.supportedLocales.map((locale) =>
                    buildLanguageItem(locale, locale == state.locale)),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
