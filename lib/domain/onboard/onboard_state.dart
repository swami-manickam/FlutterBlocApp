part of 'onboard_bloc.dart';

abstract class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialOnboardingState extends OnboardingState {}

class PageChangedState extends OnboardingState {
  final int pageIndex;

  PageChangedState(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class OnboardingCompletedState extends OnboardingState {}
