import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/menu.dart';
import 'package:meals_app/ui/menu_recipe/menu_recipe_page.dart';

class MenuSection extends StatefulWidget {
  List<Menu> menu;
  var context;
  MenuSection({this.context, this.menu});

  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.menu.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return _buildRowMenu(widget.menu[index]);
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
