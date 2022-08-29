import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../page/prueba_page_turn.dart';

class Paleta extends StatefulWidget {
  Paleta({Key? key}) : super(key: key);

  @override
  State<Paleta> createState() => _PaletaState();
}

class _PaletaState extends State<Paleta> {
  // GlobalKey<FlipWidgetState> _flipKey = GlobalKey();
   double _MinNumber = 0.008;
double _clampMin(double v) {
  if (v < _MinNumber && v > -_MinNumber) {
    if (v >= 0) {
      v = _MinNumber;
    } else {
      v = -_MinNumber;
    }
  }
  return v;
}
  @override
  Widget build(BuildContext context) {
    Size size = Size(256, 256);
     Offset _oldPosition = Offset.zero;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            //vertical
            alignment: Alignment.center,
            child: const Icon(Icons.home, size: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          GestureDetector(
            onTap: (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>PruebaPageTurn(
       )));
      print("cargando");

            },
            child:  Container(
                height: 30,
                width: 30,
                //vertical
                alignment: Alignment.center,
                child: const Icon(
                  Icons.edit,
                  size: 22,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                ),
              
            ),
            
            
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 30,
            width: 30,
            //vertical
            alignment: Alignment.center,
            child: const Icon(Icons.text_decrease, size: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 30,
            width: 30,
            //vertical
            alignment: Alignment.center,
            child: const Icon(Icons.travel_explore_sharp, size: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 30,
            width: 30,
            //vertical
            alignment: Alignment.center,
            child: const Icon(Icons.more_horiz, size: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
