import 'dart:async';

import 'package:flutter/material.dart';
import 'package:z102_libreta/page/pruba_nav_calendar.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:z102_libreta/widget/color_dos.dart';
import 'package:z102_libreta/widget/color_uno.dart';

import '../widget/color_tres.dart';

class PruebaPageTurn extends StatefulWidget {
  PruebaPageTurn({Key? key}) : super(key: key);

  @override
  State<PruebaPageTurn> createState() => _PruebaPageTurnState();
}

class _PruebaPageTurnState extends State<PruebaPageTurn> {
  //  final _controller = GlobalKey<PageTurnState>();

  final StreamController <int> _flipController  = new StreamController<int>.broadcast();
   int _nextFlipValue =0;
    List <Widget> colores=[ColorUno(), ColorDos(),ColorTres()];
  @override
  Widget build(BuildContext context) {
     final yesterday = DateTime.now().add(const Duration(days: -1)).day;
    final today = DateTime.now().day;
    return Scaffold(
      appBar: AppBar(title: const Text('Book')),
      body: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _flipWheel,
        ],
      ),
    ),
      ),
    );
  }
       Widget get _flipWheel =>
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _flipWidget(AxisDirection.left),
              
             
            ],
          ),
          SizedBox(height:40),
           GestureDetector(
                onTap: (){
                 _flip();    
                },
                child: Container(
                  width: 120,
                  height:50,
                  decoration: BoxDecoration(
                    color:Colors.black,
                    borderRadius:BorderRadiusDirectional.circular(10),
                  ),
                  child:Center(child: Text("Siguiente Pagina", style:TextStyle(color: Colors.white))),
                )),
               
        ],
      ),
    );
     Widget _flipWidget(AxisDirection direction) =>
    FlipWidget(
      flipType: FlipType.middleFlip,
      itemStream: _flipController.stream,
      itemBuilder: _itemBuilder,
      initialValue: _nextFlipValue,
      flipDirection: direction,
      hingeWidth: 1.0,
      hingeLength: 56.0,
      hingeColor: Colors.black,
    );
    Widget _itemBuilder(BuildContext context, int? value) =>
    
    Container(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(),
      ),
      child: Column(
        children: [
          Text("Pagina ${value!}"),
          colores[value==colores.length?value=0:value ]
          // Text(
          //   (value ?? 0).toString(),
          //   style: TextStyle(fontSize: 54.0),
          // ),
        ],
      ),
    );
    
      void _flip() {
        setState(() {
          _flipController.add(++_nextFlipValue % 40);
          
        });
      }
      void _flipReverse(){
        setState(() {
          // _flipController.add(--_nextFlipValue % 20);
          
        });
      }
      


}