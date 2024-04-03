import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageInitial> {
  LandingPageBloc()
      : super(LandingPageInitial(tabIndex: 0, appBarName: "Bloc App")) {
    on<LandingPageTabChangeEvent>(landingPageTabChangeEvent);
  }

  FutureOr<void> landingPageTabChangeEvent(
      LandingPageTabChangeEvent event, Emitter<LandingPageState> emit) {
    emit(TabChangeActionState(
        tabIndex: event.tabIndex, appBarName: event.appBarName));
  }
}
