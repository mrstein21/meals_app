import 'package:equatable/equatable.dart';
import 'package:meals_app/model/menu.dart';

abstract class ListMenuByAreaState extends Equatable {}

class ListMenuByAreaLoadedState extends ListMenuByAreaState {
  List<Menu> list;
  ListMenuByAreaLoadedState({this.list});

  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class ListMenuByAreaLoadingState extends ListMenuByAreaState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ListMenuByAreaFailedState extends ListMenuByAreaState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
