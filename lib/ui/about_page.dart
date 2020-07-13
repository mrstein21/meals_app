import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var tools = [
    {"nama": "Visual Studio", "icon": "assets/visual.png"},
    {"nama": "Postman", "icon": "assets/postman.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildCover(),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tentang Aplikasi",
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Aplikasi ini adalah aplikasi yang bertemakan tentang resep makanan di dalamnya berisikan kategori makanan ,tata cara pembuat dan bahan makanan untuk membuat masakan tersebut ",
                  style: TextStyle(fontSize: 12, fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Tujuan",
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Tujuan dibuatnya aplikasi ini adalah untuk memenuhi syarat lulus Test Skill Mobile Developer Step - 2 CODE_HOUSE ",
                  style: TextStyle(fontSize: 12, fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Tools yang dipakai",
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          _buildTool()
        ],
      ),
    );
  }

  Widget _buildTool() {
    return ListView.builder(
        itemCount: tools.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              tools[index]["icon"],
              height: 30,
              width: 30,
            ),
            title: Text(
              tools[index]["nama"],
              style: TextStyle(fontFamily: "Roboto"),
            ),
          );
        });
  }

  Widget _buildCover() {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage("assets/profil.jpg"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Mohammad Rangga Jayaswara",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "A Programmer who wants to share knowledge",
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontFamily: "Montserrat"),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "mohammadrangga27@gmail.com",
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }
}
