import 'package:meals_app/bloc/search_menu/search_menu_event.dart';
import 'package:meals_app/bloc/search_menu/search_menu_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/resource/menu_repository.dart';

class SearchMenuBloc extends Bloc<SearchMenuEvent, SearchMenuState> {
  MenuRepository menuRepository;
  SearchMenuBloc({this.menuRepository});

  @override
  // TODO: implement initialState
  SearchMenuState get initialState => SearchMenuUnitializedState();

  @override
  Stream<SearchMenuState> mapEventToState(SearchMenuEvent event) async* {
    if (event is FetchSearchMenuEvent) {
      yield SearchMenuLoadingState();
      try {
        List<Menu> menu = await menuRepository.getSearchMenu(event.keyword);
        yield SearchMenuLoadedState(menu: menu);
      } catch (e) {
        yield SearchMenuFailedState();
      }
    } else if (event is RefreshSearchMenuEvent) {
      yield SearchMenuUnitializedState();
    }
    // TODO: implement mapEventToState
  }
}
