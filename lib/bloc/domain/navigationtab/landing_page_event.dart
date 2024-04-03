part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageEvent {}

class LandingPageFetchUserDataEvent extends LandingPageEvent {
  final int tabIndex;
  final String appBarName;

  LandingPageFetchUserDataEvent(
      {required this.tabIndex, required this.appBarName});
}

class LandingPageTabChangeEvent extends LandingPageEvent {
  final int tabIndex;
  final String appBarName;

  LandingPageTabChangeEvent({required this.tabIndex, required this.appBarName});
}
