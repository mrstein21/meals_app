import 'package:equatable/equatable.dart';
import 'package:meals_app/model/menu.dart';

abstract class ListMenuByCategoryState extends Equatable {}

class ListMenuByCategoryLoadedState extends ListMenuByCategoryState {
  List<Menu> list;
  ListMenuByCategoryLoadedState({this.list});

  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class ListMenuByCategoryLoadingState extends ListMenuByCategoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ListMenuByCategoryFailedState extends ListMenuByCategoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
