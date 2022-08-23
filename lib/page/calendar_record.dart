import 'package:flip_widget/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import 'calendar.dart';
import 'one_page.dart';
import 'dart:math' as math;

class CalendarRecord extends StatefulWidget {
  CalendarRecord({Key? key}) : super(key: key);

  @override
  State<CalendarRecord> createState() => _CalendarRecordState();
}
const double _MinNumber = 0.008;
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

class _CalendarRecordState extends State<CalendarRecord> {
   GlobalKey<FlipWidgetState> _flipKey = GlobalKey();
   Offset _oldPosition = Offset.zero;
   Size size = Size(256, 256);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Calendario"),
      ),
      body:SizedBox(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Fecha Importante", style:TextStyle(fontSize: 25)),
            SizedBox(height:15),
          Center(
          child: GestureDetector(
            child: FlipWidget(
              key: _flipKey,
               textureSize: size * 2,
              child: Container(
                width: MediaQuery.of(context).size.width*0.886,
                height:MediaQuery.of(context).size.height*0.52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.79,
                      height: MediaQuery.of(context).size.height*0.5,
                      child: Calendar(),
                    ),
                    Positioned(
                      left: -13,
                      child: Container(
                        width: 55.7,
                        height: 828,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset("assets/calendarioArgoll.PNG"),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  
                  
                  ],
                ),
                
              ),
            ),

   onHorizontalDragStart: (details) {
                      _oldPosition = details.globalPosition;
                      _flipKey.currentState?.startFlip();   
                    },
                    onHorizontalDragUpdate: (details) {
                      Offset off = details.globalPosition - _oldPosition;
                      double tilt = 1 / _clampMin((-off.dy + 20) / 100);
                      double percent = math.max(0, -off.dx / size.width * 1.3);
                      percent = percent - percent / 2 * (1 - 1 / tilt);
                      _flipKey.currentState?.flip(percent, tilt);
                     
                    },
                    onHorizontalDragEnd: (details) {
                      _flipKey.currentState?.stopFlip();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>OnePage(
     )));
                    },
                    onHorizontalDragCancel: () {
                      _flipKey.currentState?.stopFlip();
                      
                    },
          ),
        ),










        ]),
      )
    );
  }
}