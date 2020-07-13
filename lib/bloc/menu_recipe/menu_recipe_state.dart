import 'package:equatable/equatable.dart';
import 'package:meals_app/model/ingredients.dart';
import 'package:meals_app/model/menu_detail.dart';

abstract class MenuRecipeState extends Equatable {}

class MenuRecipeLoadedState extends MenuRecipeState {
  MenuDetail menuDetail;
  List<Ingredients> list;
  MenuRecipeLoadedState({this.menuDetail, this.list});
  @override
  // TODO: implement props
  List<Object> get props => [menuDetail, list];
}

class MenuRecipeLoadingState extends MenuRecipeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MenuRecipeFailedState extends MenuRecipeState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
