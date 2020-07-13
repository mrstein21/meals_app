import 'package:equatable/equatable.dart';

abstract class MenuRecipeEvent extends Equatable {}

class FetchMenuRecipeEvent extends MenuRecipeEvent {
  String id;
  FetchMenuRecipeEvent({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
