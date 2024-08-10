part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class NextPageState extends OnboardingState {}
class ChangeDotsState extends OnboardingState {}

