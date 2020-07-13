import 'package:meals_app/bloc/list_menu_by_area/list_menu_by_area_event.dart';
import 'package:meals_app/bloc/list_menu_by_area/list_menu_by_area_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/resource/menu_repository.dart';

class ListMenuByAreaBloc
    extends Bloc<ListMenuByAreaEvent, ListMenuByAreaState> {
  MenuRepository menuRepository;
  ListMenuByAreaBloc({this.menuRepository});
  @override
  // TODO: implement initialState
  ListMenuByAreaState get initialState => ListMenuByAreaLoadingState();

  @override
  Stream<ListMenuByAreaState> mapEventToState(
      ListMenuByAreaEvent event) async* {
    if (event is FetchListMenuByAreaEvent) {
      yield ListMenuByAreaLoadingState();
      try {
        List<Menu> menu = await menuRepository.getMenu(event.area);
        yield ListMenuByAreaLoadedState(list: menu);
      } catch (e) {
        yield ListMenuByAreaFailedState();
      }
    }
    // TODO: implement mapEventToState
  }
}
