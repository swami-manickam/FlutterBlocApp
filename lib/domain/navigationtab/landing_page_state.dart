part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageState {}

class LandingPageInitial extends LandingPageState {
  final int tabIndex;
  final String appBarName;

  LandingPageInitial({required this.appBarName, required this.tabIndex});
}

class TabChangeActionState extends LandingPageInitial {
  TabChangeActionState({required super.appBarName, required super.tabIndex});
}
