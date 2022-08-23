import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:z102_libreta/page/one_page.dart';
import 'package:z102_libreta/widget/header.dart';
import 'package:z102_libreta/widget/libreta.dart';
import 'package:z102_libreta/widget/paleta.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Libreta"),
      ),
      body: SingleChildScrollView(
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
                  Libreta(),
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