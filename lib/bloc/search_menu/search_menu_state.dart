import 'package:equatable/equatable.dart';
import 'package:meals_app/model/menu.dart';

abstract class SearchMenuState extends Equatable {}

class SearchMenuLoadedState extends SearchMenuState {
  List<Menu> menu;
  SearchMenuLoadedState({this.menu});

  @override
  // TODO: implement props
  List<Object> get props => [menu];
}

class SearchMenuLoadingState extends SearchMenuState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchMenuUnitializedState extends SearchMenuState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class SearchMenuFailedState extends SearchMenuState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
