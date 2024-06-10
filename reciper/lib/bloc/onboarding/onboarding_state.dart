import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool isCompleted;

  const OnboardingState({required this.isCompleted});

  @override
  List<Object?> get props => [isCompleted];
}
