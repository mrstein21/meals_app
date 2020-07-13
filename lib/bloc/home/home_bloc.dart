import 'package:meals_app/bloc/home/home_event.dart';
import 'package:meals_app/bloc/home/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/resource/category_resource.dart';
import 'package:meals_app/resource/menu_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  CategoryRepository categoryRepository;
  MenuRepository menuRepository;
  HomeBloc({this.categoryRepository, this.menuRepository});

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeLoadingState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeEvent) {
      yield HomeLoadingState();
      try {
        List<Menu> menu = await menuRepository.getMenu("Italian");
        List<Categories> category = await categoryRepository.getCategory();
        yield HomeLoadedState(category: category, menu: menu);
      } catch (e) {
        yield HomeFailedState();
      }
    }
  }
}
