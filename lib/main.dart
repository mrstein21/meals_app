import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/home/home_bloc.dart';
import 'package:meals_app/bloc/list_menu_by_area/list_menu_by_area_bloc.dart';
import 'package:meals_app/bloc/list_menu_by_category/list_menu_by_category_bloc.dart';
import 'package:meals_app/bloc/menu_recipe/menu_recipe_bloc.dart';
import 'package:meals_app/bloc/search_menu/search_menu_bloc.dart';
import 'package:meals_app/resource/category_resource.dart';
import 'package:meals_app/resource/menu_repository.dart';
import 'package:meals_app/ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
              categoryRepository: CategoryRepositoryImp(),
              menuRepository: MenuRepositoryImp()),
        ),
        BlocProvider<ListMenuByCategoryBloc>(
          create: (context) =>
              ListMenuByCategoryBloc(menuRepository: MenuRepositoryImp()),
        ),
        BlocProvider<SearchMenuBloc>(
          create: (context) =>
              SearchMenuBloc(menuRepository: MenuRepositoryImp()),
        ),
        BlocProvider<MenuRecipeBloc>(
          create: (context) =>
              MenuRecipeBloc(menuRepository: MenuRepositoryImp()),
        ),
        BlocProvider<ListMenuByAreaBloc>(
          create: (context) =>
              ListMenuByAreaBloc(menuRepository: MenuRepositoryImp()),
        ),
      ], child: HomePage()),
    );
  }
}
