import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reciper/bloc/ai/ai_cubit.dart';
import 'package:reciper/bloc/language/language_cubit.dart';
import 'package:reciper/bloc/language/language_state.dart';
import 'package:reciper/bloc/onboarding/onboarding_cubit.dart';
import 'package:reciper/bloc/onboarding/onboarding_state.dart';
import 'package:reciper/bloc/recipe/recipe_cubit.dart';
import 'package:reciper/bloc/theme/theme_cubit.dart';
import 'package:reciper/bloc/theme/theme_state.dart';
import 'package:reciper/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
    BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
    BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
    BlocProvider<RecipeCubit>(create: (context) => RecipeCubit()),
    BlocProvider<AiCubit>(create: (context) => AiCubit()),
  ], child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    BlocProvider.of<OnboardingCubit>(context).initOnboarding();
    String languageCode =
        BlocProvider.of<LanguageCubit>(context).state.locale.languageCode;
    BlocProvider.of<RecipeCubit>(context).initRecipes(languageCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, onboardingState) {
      return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
        return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
          return MaterialApp.router(
            locale: languageState.locale, // Uygulamanın dili
            supportedLocales:
                AppLocalizations.supportedLocales, // Desteklenen diller
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              /// [locale]: Cihazın dili null değilse
              if (locale != null) {
                debugPrint(
                    "Detected device language: Language Code: ${locale.languageCode}, Country Code: ${locale.countryCode}");

                /// for döngüsü yardımıyla [supportedLocales] listesi içinde arama yapıyoruz
                for (var supportedLocale in supportedLocales) {
                  /// Cihazın dil kodu [locale.languageCode] ve ülke kodu [locale.countryCode]
                  /// desteklenen diller arasındaki dil ve ülke kodlarının içinde [supportedLocale] var mı?
                  if (supportedLocale.languageCode == locale.languageCode &&
                      locale.countryCode == locale.countryCode) {
                    /// Varsa desteklenen dili döndür
                    return supportedLocale;
                  }
                }
              }
              debugPrint("Language is not available.");

              /// Yoksa [supportedLocales] Listesindeki ilk sonucu döndür.
              return supportedLocales.first;
            },

            routerConfig: GoRouter(
              routes: AppRouter().routes,
              initialLocation: onboardingState.isCompleted
                  ? AppRouter.homeRoute
                  : AppRouter.onboardingRoute,
            ),
            title: 'Reciper App',
            theme: themeState.theme.lightTheme,
            darkTheme: themeState.theme.darkTheme,
            themeMode: themeState.themeMode,
            debugShowCheckedModeBanner: false,
          );
        });
      });
    });
  }
}
