import 'package:flutter/material.dart';
import 'package:z102_libreta/page/pruba_nav_calendar.dart';

class PruebaPageTurn extends StatefulWidget {
  PruebaPageTurn({Key? key}) : super(key: key);

  @override
  State<PruebaPageTurn> createState() => _PruebaPageTurnState();
}

class _PruebaPageTurnState extends State<PruebaPageTurn> {
  //  final _controller = GlobalKey<PageTurnState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // child: PageTurn(
        //   key: _controller,
        //   backgroundColor: Colors.white,
        //   showDragCutoff: false,
        //   lastPage: Container(child: Center(child: Text('Last Page!'))),
        //   children: <Widget>[
        //     for (var i = 0; i < 20; i++) PruebaNavCalenadar(),
        //   ],
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.search),
      //   onPressed: () {
      //     _controller.currentState?.goToPage(2);
      //   },
      // ),
    );
  }
}