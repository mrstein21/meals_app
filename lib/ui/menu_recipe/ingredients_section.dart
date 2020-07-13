import 'package:flutter/material.dart';
import 'package:meals_app/model/ingredients.dart';

class IngredientsSection extends StatefulWidget {
  List<Ingredients> list;
  IngredientsSection({this.list});

  @override
  _IngredientsSectionState createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.list[index].ingredients,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Roboto")),
                  SizedBox(
                    height: 6,
                  ),
                  Text(widget.list[index].measure,
                      style: TextStyle(fontSize: 12, fontFamily: "Montserrat")),
                ],
              ),
              padding: EdgeInsets.all(5),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: widget.list.length),
    );
  }
}
