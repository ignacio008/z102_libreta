import 'package:flutter/material.dart';

import '../widget/header.dart';
import '../widget/libretaVacia.dart';
import '../widget/paleta.dart';

class OnePage extends StatefulWidget {
  OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Primera pagina"),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          color:Colors.grey[200],
          child:Column(
            children: [
              Row(
                children: [
                  Header(),
                ],
              ),
              Row(
                children:[
                  LibretaVacia(),
                ]
              ),
              Row(
                children:[
                  Paleta(),
                ]
              )
            ],
          ),
            
          ),
      ),
    );
  }
}