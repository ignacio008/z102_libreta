import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:z102_libreta/page/calendars.dart';
import 'package:z102_libreta/page/calendar_record.dart';
import 'package:z102_libreta/page/one_page.dart';
import 'package:flip_widget/flip_widget.dart';
import 'dart:math' as math;

import 'package:z102_libreta/page/pruba_nav_calendar.dart';

class Libreta extends StatefulWidget {
  Libreta({Key? key}) : super(key: key);

  @override
  State<Libreta> createState() => _LibretaState();
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
class _LibretaState extends State<Libreta> {
   GlobalKey<FlipWidgetState> _flipKey = GlobalKey();
   Offset _oldPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    
    Size size = Size(256, 256);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.grey[200],
        child: Center(
          child: GestureDetector(
            child: FlipWidget(
              key: _flipKey,
               textureSize: size * 2,
              child: Container(
                width: 308,
                height: 456,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 276,
                      height: 426,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "assets/Captura.PNG",
                        ),
                      ),
                    ),
                    Positioned(
                      left: -7,
                      child: Container(
                        width: 43.7,
                        height: 628,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset("assets/arg.PNG"),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 25,
                        bottom: 2,
                        child: RaisedButton(
                          color: Colors.grey[700],
                          onPressed: () {
                            print("mas");
                            Navigator.push(
                              context,
                              TurnPageRoute(
                                overleafColor: Color.fromARGB(255, 226, 187, 187),
                                turningPoint: 0.2,
                                transitionDuration: const Duration(seconds: 3),
                                builder: (context) => OnePage(),
                              ),
                            );
                          },
                          child: Icon(Icons.add, size: 15.0, color: Colors.white),
                          shape: CircleBorder(),
                        )),
                    Positioned(
                        right: -20,
                        bottom: 2,
                        child: RaisedButton(
                          color: Colors.grey[700],
                          onPressed: () {
                            print("menos");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PruebaNavCalenadar(
     )));

                          },
                          child:
                              Icon(Icons.remove, size: 15.0, color: Colors.white),
                          shape: CircleBorder(),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
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
      ),
    );
  }
}
