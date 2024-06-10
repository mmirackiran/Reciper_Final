import 'package:go_router/go_router.dart';
import 'package:reciper/ui/views/home_view.dart';
import 'package:reciper/ui/views/onboarding_view.dart';
import 'package:reciper/ui/views/settings_view.dart';
import 'package:reciper/ui/views/gpt_response_view.dart';

class AppRouter {
  static const onboardingRoute = '/onboarding';
  static const settingsRoute = '/settings';
  static const aiResponseRoute = '/ai-response';
  static const homeRoute = '/';

  List<RouteBase> routes = [
    GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
    GoRoute(path: settingsRoute, builder: (context, state) => const SettingsView()),
    GoRoute(
        path: onboardingRoute,
        builder: (context, state) => const OnboardingView()),
    GoRoute(path: aiResponseRoute, builder: (context, state) => const GptResponseView()),
  ];
}
