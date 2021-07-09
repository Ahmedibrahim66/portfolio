import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial());

  @override
  Stream<MainPageState> mapEventToState(
    MainPageEvent event,
  ) async* {
    if (event is StartInitialAnimation) {
      yield ShowInitialAnimation();
    }
    if (event is ScrollToIndex) {
      if (event.index == 0) {
        yield ShowHomePage();
      } else if (event.index == 1) {
        yield ShowAboutMePage();
      } else if (event.index == 2) {
        yield ShowAbuEishehPage();
      } else if (event.index == 3) {
        yield ShowSpartanFitnessPage();
      } else if (event.index == 4) {
        yield ShowGetInTouchPage();
      }
    }

    if (event is NavigateToMoreInfo) {
      yield ShowMoreInfoPageAnimation();
    }

    if (event is NavigateToHomePage) {
      print("Reviced evetn");
      yield ShowBackToMainPageAnimation();
    }
  }
}
