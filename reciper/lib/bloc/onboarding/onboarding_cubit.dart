import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reciper/bloc/onboarding/onboarding_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(isCompleted: false));

  Future<void> initOnboarding() async {
    print("x");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isCompleted = preferences.getBool('ONBOARDING_COMPLETED') ?? false;
    emit(OnboardingState(isCompleted: isCompleted));
  }

  Future<void> completeOnboarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('ONBOARDING_COMPLETED', true);
    emit(const OnboardingState(isCompleted: true));
  }
}
