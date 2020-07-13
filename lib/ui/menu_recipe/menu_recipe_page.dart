import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/menu_recipe/menu_recipe_bloc.dart';
import 'package:meals_app/bloc/menu_recipe/menu_recipe_event.dart';
import 'package:meals_app/bloc/menu_recipe/menu_recipe_state.dart';
import 'package:meals_app/model/ingredients.dart';
import 'package:meals_app/model/menu_detail.dart';
import 'package:meals_app/ui/menu_recipe/ingredients_section.dart';

import 'instructions_section_page.dart';

class MenuRecipePage extends StatefulWidget {
  var context;
  String id;
  MenuRecipePage({this.context, this.id});

  @override
  _MenuRecipePageState createState() => _MenuRecipePageState();
}

class _MenuRecipePageState extends State<MenuRecipePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  MenuRecipeBloc menuRecipeBloc;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    menuRecipeBloc = BlocProvider.of(widget.context);
    menuRecipeBloc.add(FetchMenuRecipeEvent(id: widget.id));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuRecipeBloc, MenuRecipeState>(
          bloc: menuRecipeBloc,
          builder: (context, state) {
            if (state is MenuRecipeFailedState) {
              return _buildMessage();
            } else if (state is MenuRecipeLoadingState) {
              return _buildLoading();
            } else if (state is MenuRecipeLoadedState) {
              return _buildRecipe(state.menuDetail, state.list);
            }
          }),
    );
  }

  Widget _buildRecipe(MenuDetail menuDetail, List<Ingredients> list) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: false,
          title: Text(
            menuDetail.strMeal,
            style: TextStyle(fontFamily: "Roboto"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          expandedHeight: 240.0,
          pinned: true,
          snap: false,
          floating: false,
          bottom: TabBar(controller: _tabController, tabs: [
            Tab(
              text: "Instructions",
            ),
            Tab(
              text: "Ingredients",
            ),
          ]),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 240.0,
              width: double.infinity,
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(menuDetail.strMealThumb))),
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(controller: _tabController, children: [
            InstructionSection(
              instructions: menuDetail.instructions,
            ),
            IngredientsSection(
              list: list,
            ),
          ]),
        )
      ],
    );
  }

  Widget _buildMessage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              color: Colors.grey,
              size: 70,
            ),
            Text(
              "Can't Connect to Server",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
