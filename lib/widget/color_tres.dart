import 'package:flutter/material.dart';

class ColorTres extends StatefulWidget {
  ColorTres({Key? key}) : super(key: key);

  @override
  State<ColorTres> createState() => _ColorTresState();
}

class _ColorTresState extends State<ColorTres> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.45,
      color: Colors.green[300],
      child:const Center(child: Text("green")),
    );
  }
}