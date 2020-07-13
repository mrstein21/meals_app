import 'package:flutter/material.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/ui/list_menu_by_category_page.dart';

class CategorySection extends StatefulWidget {
  List<Categories> list;
  var context;
  CategorySection({this.list, this.context});
  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (ctx, index) {
            return _buildRowCategory(widget.list[index]);
          }),
    );
  }

  Widget _buildRowCategory(Categories categories) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context2) => ListMenuByCategoryPage(
                thumb: categories.strCategoryThumb,
                category: categories.strCategory,
                context: widget.context,
              ),
            ));
      },
      child: Container(
        height: 150,
        width: 280,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    categories.strCategory,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    categories.strCategoryDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            )
          ],
        ),
        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(categories.strCategoryThumb))),
      ),
    );
  }
}
