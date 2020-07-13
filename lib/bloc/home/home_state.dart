import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/model/menu.dart';

abstract class HomeState extends Equatable {}

class HomeLoadedState extends HomeState {
  List<Menu> menu;
  List<Categories> category;

  HomeLoadedState({this.menu, this.category});

  @override
  // TODO: implement props
  List<Object> get props => [menu, category];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeFailedState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
