import 'package:equatable/equatable.dart';

abstract class ListMenuByCategoryEvent extends Equatable {}

class FetchListMenuByCategoryEvent extends ListMenuByCategoryEvent {
  String category;
  FetchListMenuByCategoryEvent({this.category});

  @override
  // TODO: implement props
  List<Object> get props => [category];
}
