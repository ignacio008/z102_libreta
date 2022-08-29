import 'package:flutter/material.dart';
class ColorUno extends StatefulWidget {
  ColorUno({Key? key}) : super(key: key);

  @override
  State<ColorUno> createState() => _ColorUnoState();
}

class _ColorUnoState extends State<ColorUno> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.45,
      color: Colors.red[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Rojo"),
           Text("Rojo 2"),
        ],
      ),
    );
  }
}