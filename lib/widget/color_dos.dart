import 'package:flutter/material.dart';

import 'efect_page2_widget.dart';
import 'efect_page_widget.dart';

class ColorDos extends StatefulWidget {
  ColorDos({Key? key}) : super(key: key);

  @override
  State<ColorDos> createState() => _ColorDosState();
}

class _ColorDosState extends State<ColorDos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.45,
      color: Colors.blue[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EfectPageWidget(),
          EfectPage2Widget(),
        ],
      ),
    );
  }
}