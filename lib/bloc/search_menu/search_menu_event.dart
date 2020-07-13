import 'package:equatable/equatable.dart';

abstract class SearchMenuEvent extends Equatable {}

class FetchSearchMenuEvent extends SearchMenuEvent {
  String keyword;
  FetchSearchMenuEvent({this.keyword});
  @override
  // TODO: implement props
  List<Object> get props => [keyword];
}

class RefreshSearchMenuEvent extends SearchMenuEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
