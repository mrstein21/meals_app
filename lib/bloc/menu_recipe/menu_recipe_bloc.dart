import 'dart:convert';

import 'package:meals_app/bloc/menu_recipe/menu_recipe_event.dart';
import 'package:meals_app/bloc/menu_recipe/menu_recipe_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meals_app/model/ingredients.dart';
import 'package:meals_app/model/menu_detail.dart';
import 'package:meals_app/resource/menu_repository.dart';

class MenuRecipeBloc extends Bloc<MenuRecipeEvent, MenuRecipeState> {
  MenuRepository menuRepository;
  MenuRecipeBloc({this.menuRepository});

  @override
  // TODO: implement initialState
  MenuRecipeState get initialState => MenuRecipeLoadingState();

  @override
  Stream<MenuRecipeState> mapEventToState(MenuRecipeEvent event) async* {
    if (event is FetchMenuRecipeEvent) {
      yield MenuRecipeLoadingState();
      try {
        String response = await menuRepository.getMenuRecipe(event.id);
        var json2 = json.decode(response);
        MenuDetail menu_detail = MenuDetail();
        List<Ingredients> list = new List<Ingredients>();
        menu_detail.strMeal = json2["meals"][0]["strMeal"];
        menu_detail.strMealThumb = json2["meals"][0]["strMealThumb"];
        menu_detail.instructions = json2["meals"][0]["strInstructions"];
        menu_detail.strYoutube = json2["meals"][0]["strYoutube"];
        for (int i = 1; i <= 20; i++) {
          String ingredients =
              json2["meals"][0]["strIngredient" + i.toString()];
          String measure = json2["meals"][0]["strMeasure" + i.toString()];

          if (ingredients != "" || measure != "") {
            Ingredients indgredintsModel =
                Ingredients(ingredients: ingredients, measure: measure);
            list.add(indgredintsModel);
          }
        }
        yield MenuRecipeLoadedState(menuDetail: menu_detail, list: list);
      } catch (e) {
        print(e.toString());
        yield MenuRecipeFailedState();
      }
    }

    // TODO: implement mapEventToState
  }
}
