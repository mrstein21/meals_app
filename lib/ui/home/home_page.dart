import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/home/home_bloc.dart';
import 'package:meals_app/bloc/home/home_event.dart';
import 'package:meals_app/bloc/home/home_state.dart';
import 'package:meals_app/ui/about_page.dart';
import 'package:meals_app/ui/home/category_section.dart';
import 'package:meals_app/ui/home/menu_section.dart';
import 'package:meals_app/ui/list_menu_by_area.dart';

import '../search_menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc;
  var area = [
    "American",
    "Italian",
    "British",
    "Canadian",
    "French",
    "Chinese",
    "Indian",
    "Japanese",
    "Mexican"
  ];

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(FetchHomeEvent());
    super.initState();
  }

  void initDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Select Recipe",
              style:
                  TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold),
            ),
            content: ListView.builder(
                itemCount: area.length,
                itemBuilder: (ctx2, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.of(context).pop();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context2) => ListMenuByAreaPage(
                                area: area[index],
                                context: context,
                              ),
                            ));
                      },
                      title: Text(
                        area[index],
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ));
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context2) => AboutPage(),
              ));
        },
        tooltip: 'About',
        child: Icon(Icons.info),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: Image.asset(
          "assets/icon.png",
          width: 190,
          height: 190,
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context2) => SearchMenuPage(context: context),
                    ));
              },
              child: Icon(Icons.search)),
          SizedBox(width: 5)
        ],
      ),
      body: Container(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return _buildLoading();
        } else if (state is HomeFailedState) {
          return _buildMessage();
        } else if (state is HomeLoadedState) {
          return _buildHome(state);
        }
      })),
    );
  }

  Widget _buildHome(HomeLoadedState state) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text("Category",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 6),
          CategorySection(context: context, list: state.category),
          SizedBox(height: 14),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Italian's Recipe",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    initDialog();
                  },
                  child: Text("Another recipe",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: 6),
          MenuSection(
            context: context,
            menu: state.menu,
          ),
          SizedBox(height: 6),
        ],
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
