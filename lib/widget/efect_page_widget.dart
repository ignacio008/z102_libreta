import 'package:flutter/material.dart';

class EfectPageWidget extends StatefulWidget {
  EfectPageWidget({Key? key}) : super(key: key);

  @override
  State<EfectPageWidget> createState() => _EfectPageWidgetState();
}

class _EfectPageWidgetState extends State<EfectPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width*0.4,
            height: MediaQuery.of(context).size.height ,
            color:Colors.green,
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
                      right: -19,
                      child: Container(
                        width: 43.7,
                        height: 628,
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
                decoration: BoxDecoration(
                 
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
            
            );
  }
}