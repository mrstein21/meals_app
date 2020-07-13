import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InstructionSection extends StatefulWidget {
  String instructions;
  InstructionSection({this.instructions});
  @override
  _InstructionSectionState createState() => _InstructionSectionState();
}

class _InstructionSectionState extends State<InstructionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: <Widget>[
          Text(
            widget.instructions,
            style: TextStyle(fontFamily: "Montserrat"),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
