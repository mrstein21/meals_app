import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/search_menu/search_menu_bloc.dart';
import 'package:meals_app/bloc/search_menu/search_menu_event.dart';
import 'package:meals_app/bloc/search_menu/search_menu_state.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/ui/menu_recipe/menu_recipe_page.dart';

class SearchMenuPage extends StatefulWidget {
  var context;
  SearchMenuPage({this.context});

  @override
  _SearchMenuPageState createState() => _SearchMenuPageState();
}

class _SearchMenuPageState extends State<SearchMenuPage> {
  SearchMenuBloc searchMenuBloc;
  String keyword = "";
  @override
  void initState() {
    searchMenuBloc = BlocProvider.of(widget.context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    searchMenuBloc.add(RefreshSearchMenuEvent());
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(58, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.done,
            onChanged: (String terms) {
              if (terms.isEmpty) {
                setState(() {
                  keyword = null;
                });
                searchMenuBloc.add(RefreshSearchMenuEvent());
                //onlineExamBloc.add(RefreshOnlineExamEvent());
              }
            },
            onSubmitted: (String term) {
              keyword = term;
              if (keyword.length >= 3) {
                searchMenuBloc.add(FetchSearchMenuEvent(keyword: keyword));
              }
            },
            decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: "Search..",
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<SearchMenuBloc, SearchMenuState>(
          bloc: searchMenuBloc,
          builder: (context, state) {
            if (state is SearchMenuUnitializedState) {
              return _buildFirst();
            } else if (state is SearchMenuLoadingState) {
              return _buildLoading();
            } else if (state is SearchMenuFailedState) {
              return _buildEmpty();
            } else if (state is SearchMenuLoadedState) {
              if (state.menu.isEmpty) {
                return _buildEmpty();
              }
              return _buildListMenu(state.menu);
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.play_circle_filled,
              color: Colors.grey,
              size: 70,
            ),
            Text(
              "Cannot find Meal",
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

  Widget _buildFirst() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 70,
            ),
            Text(
              "Find Menu Here",
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
