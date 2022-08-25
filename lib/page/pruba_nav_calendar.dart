import 'dart:collection';

// import 'package:device_calendar/device_calendar.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flip_widget/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:z102_libreta/models/meeting_description_calen_model.dart';
import 'package:flutter_fadein/flutter_fadein.dart';


import 'dart:math' as math;

class PruebaNavCalenadar extends StatefulWidget {
  PruebaNavCalenadar({Key? key}) : super(key: key);

  @override
  State<PruebaNavCalenadar> createState() => _PruebaNavCalenadarState();
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


class _PruebaNavCalenadarState extends State<PruebaNavCalenadar> {

GlobalKey<FlipWidgetState> _flipKey = GlobalKey();
   Offset _oldPosition = Offset.zero;
   Size size = Size(256, 256);
final controller = FadeInController();

fadeIn(){
  setState(() {   
  controller.fadeIn();
  });
}
  @override
  void initState() {
    // TODO: implement initState
    // getUsersCalendar();
    fadeIn();
    super.initState();
  }

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
            Text("Calendario", style:TextStyle(fontSize: 25)),
            SizedBox(height:15),
          Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.4,
        // color:Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    
                  },
                  child: Container(
                  width: MediaQuery.of(context).size.width*0.45,
                  height:MediaQuery.of(context).size.height*0.4,
                  color:Colors.grey[400],
                  child:Column(
                    children: [
                      Container(
                              height: 30,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("Monday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("Tuesday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("Wednesday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              
                GestureDetector(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    height:MediaQuery.of(context).size.height*0.4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FadeIn(
                          duration: Duration(milliseconds: 550),
                              curve: Curves.easeIn,
                              controller: controller,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.44, 
                           color:Colors.grey[400],
                           child:
                           
                           Column(
                    children: [
                      Container(
                              height: 30,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("Thursday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("friday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("saturday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                             Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              padding: EdgeInsets.all(1.0),
                              child:const Center(
                                child: Text("sunday", style: TextStyle(
                                  fontSize: 10,
                                ),),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.1,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),

                      
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.1,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.1,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.1,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                       Container(
                        height: 60,
                        decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.13,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.11,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.1,
                               height: 60,
                              padding: EdgeInsets.all(5.0),
                              child:const Text("", style: TextStyle(
                                fontSize: 10,
                              ),),
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                           
                          ),
                        ),
                        Positioned(
                          left: -16,
                          child: Container(
                            width: 52.7,
                            height: 228,
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
              ],
            ),
          ),
        ),










        ]),
      )
    );
  }
}