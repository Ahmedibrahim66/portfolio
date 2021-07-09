part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class ScrollToIndex extends MainPageEvent {
  final int index;
  //dynamic should be PointerScrollEvent
  final dynamic event;
  ScrollToIndex(this.index, {this.event});
}

class StartInitialAnimation extends MainPageEvent {}

class NavigateToMoreInfo extends MainPageEvent {}

class NavigateToHomePage extends MainPageEvent {}
