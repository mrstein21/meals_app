import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_event.dart';
import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/resource/menu_repository.dart';

class ListMenuByCategoryBloc
    extends Bloc<ListMenuByCategoryEvent, ListMenuByCategoryState> {
  MenuRepository menuRepository;
  ListMenuByCategoryBloc({this.menuRepository});
  @override
  // TODO: implement initialState
  ListMenuByCategoryState get initialState => ListMenuByCategoryLoadingState();

  @override
  Stream<ListMenuByCategoryState> mapEventToState(
      ListMenuByCategoryEvent event) async* {
    if (event is FetchListMenuByCategoryEvent) {
      yield ListMenuByCategoryLoadingState();
      try {
        List<Menu> menu =
            await menuRepository.getMenyByCategory(event.category);
        yield ListMenuByCategoryLoadedState(list: menu);
      } catch (e) {
        yield ListMenuByCategoryFailedState();
      }
    }
    // TODO: implement mapEventToState
  }
}
