import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_bloc.dart';
import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_event.dart';
import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_state.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/ui/menu_recipe/menu_recipe_page.dart';

class ListMenuByCategoryPage extends StatefulWidget {
  String category;
  String thumb;
  var context;
  ListMenuByCategoryPage({this.category, this.context, this.thumb});

  @override
  _ListMenuByCategoryPageState createState() => _ListMenuByCategoryPageState();
}

class _ListMenuByCategoryPageState extends State<ListMenuByCategoryPage> {
  ListMenuByCategoryBloc listMenuByCategoryBloc;

  @override
  void initState() {
    listMenuByCategoryBloc =
        BlocProvider.of<ListMenuByCategoryBloc>(widget.context);
    listMenuByCategoryBloc
        .add(FetchListMenuByCategoryEvent(category: widget.category));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<ListMenuByCategoryBloc, ListMenuByCategoryState>(
            bloc: listMenuByCategoryBloc,
            builder: (context, state) {
              if (state is ListMenuByCategoryLoadedState) {
                return _buildListMenu(state.list);
              } else if (state is ListMenuByCategoryLoadingState) {
                return _buildLoading();
              } else if (state is ListMenuByCategoryFailedState) {
                return _buildMessage();
              }
            }),
      ),
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

  Widget _buildListMenu(List<Menu> menu) {
    return Container(
      child: GridView.builder(
          itemCount: menu.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return _buildRowMenu(menu[index]);
          }),
    );
  }

  Widget _buildRowMenu(Menu menu) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context2) => MenuRecipePage(
                      context: widget.context,
                      id: menu.idMeal,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.bottomLeft,
          child: Text(menu.strMeal,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(menu.strMealThumb))),
      ),
    );
  }
}
