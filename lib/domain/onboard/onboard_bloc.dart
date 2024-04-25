import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int currentIndex = 0;

  OnboardingBloc() : super(InitialOnboardingState());

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is NextPageEvent) {
      currentIndex++;
      yield PageChangedState(currentIndex);
    } else if (event is PreviousPageEvent) {
      if (currentIndex > 0) {
        currentIndex--;
        yield PageChangedState(currentIndex);
      }
    } else if (event is CompleteOnboardingEvent) {
      yield OnboardingCompletedState();
    }
  }
}
