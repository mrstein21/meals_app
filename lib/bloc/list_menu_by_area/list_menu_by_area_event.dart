import 'package:equatable/equatable.dart';

abstract class ListMenuByAreaEvent extends Equatable {}

class FetchListMenuByAreaEvent extends ListMenuByAreaEvent {
  String area;
  FetchListMenuByAreaEvent({this.area});

  @override
  // TODO: implement props
  List<Object> get props => [area];
}
