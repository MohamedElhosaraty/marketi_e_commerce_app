part of 'onboarding_cubit.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}
final class NextPageState extends OnboardingState {}
final class ChangeDotState extends OnboardingState {}
