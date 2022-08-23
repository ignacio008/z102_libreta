import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:z102_libreta/page/home.dart';
import 'package:toast/toast.dart';

import '../page/calendar_record.dart';

class LibretaVacia extends StatefulWidget {
  LibretaVacia({Key? key}) : super(key: key);

  @override
  State<LibretaVacia> createState() => _LibretaVaciaState();
}

class _LibretaVaciaState extends State<LibretaVacia> {
  late TextEditingController _recordatorioController;
  late TextEditingController _recordatorioController2;

  late TextEditingController _NormalrecordatorioController;
  late TextEditingController _NormalrecordatorioController2;
  bool isChecked = false;
  bool isChecked2 = false;
  String nuevoCampo = "Recordatorio";
  String nuevoCampo2 = "Recordatorio";
  @override
  void initState() {
    _recordatorioController = TextEditingController();
    _recordatorioController2 = TextEditingController();

    _NormalrecordatorioController = TextEditingController();
    _NormalrecordatorioController2 = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _recordatorioController.dispose();
    _recordatorioController2.dispose();
    _NormalrecordatorioController.dispose();
    _NormalrecordatorioController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMedia(BuildContext context) =>
        MediaQuery.of(context).size.width < 322;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.grey[200],
        child: Center(
          child: Container(
            width: 308,
            height: 456,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 276,
                  height: 426,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: isMedia(context) ? 40 : 30,
                          right: 5,
                          top: 5,
                          bottom: 3),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.star_border,
                                      size: 18,
                                      color:
                                          Color.fromARGB(255, 152, 202, 243)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 181, 241),
                                        width: 1)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarRecord(
     )));         
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        width: MediaQuery.of(context).size.width *
                                            0.17,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.asset("assets/calen.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                ],
                              )),
                          //2 fila
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.14,
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 181, 241),
                                        width: 1)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.10,
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: const EdgeInsets.all(1.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.14,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text("Thursday ",
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    108,
                                                                    181,
                                                                    241),
                                                            width: 1)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                              ],
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              child: TextFormField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller:
                                                    _recordatorioController,
                                                cursorColor: Colors.red,
                                                style: const TextStyle(
                                                  fontFamily: 'Futura',
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Recordatorio",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  hintStyle: const TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Futura',
                                                    color: Color.fromARGB(
                                                        137, 15, 15, 15),
                                                  ),
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Checkbox(
                                                      shape: CircleBorder(),
                                                      checkColor: Colors.white,
                                                      value: isChecked,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              child: TextFormField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller:
                                                    _recordatorioController2,
                                                cursorColor: Colors.red,
                                                style: const TextStyle(
                                                  fontFamily: 'Futura',
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Recordatorio",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  hintStyle: const TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Futura',
                                                    color: Color.fromARGB(
                                                        137, 15, 15, 15),
                                                  ),
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Checkbox(
                                                      shape: CircleBorder(),
                                                      checkColor: Colors.white,
                                                      value: isChecked2,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked2 = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: const BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                ],
                              )),
                          //3 fila
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.14,
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 181, 241),
                                        width: 1)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.10,
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: const EdgeInsets.all(1.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.14,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text("Thursday ",
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    108,
                                                                    181,
                                                                    241),
                                                            width: 1)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                                Icon(
                                                    Icons
                                                        .emoji_emotions_outlined,
                                                    size: 15),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    // return object of type Dialog
                                                    return AlertDialog(
                                                      title:
                                                          Text("Escribe aqui"),
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        child: TextFormField(
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          controller:
                                                              _NormalrecordatorioController,
                                                          cursorColor:
                                                              Colors.red,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Futura',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Recordatorio",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Futura',
                                                              color: Color
                                                                  .fromARGB(
                                                                      137,
                                                                      15,
                                                                      15,
                                                                      15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        // usually buttons at the bottom of the dialog
                                                        FlatButton(
                                                          child: new Text(
                                                              "Cancelar"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        FlatButton(
                                                          child: new Text(
                                                              "Guardar"),
                                                          onPressed: () {
                                                            // AQUI HAY QUE ACTUALIZAR
                                                            setState(() {
                                                              nuevoCampo =
                                                                  _NormalrecordatorioController
                                                                      .text
                                                                      .trim();
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  nuevoCampo,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )),
                                              ),
                                            ),
                                            SizedBox(height:4),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    // return object of type Dialog
                                                    return AlertDialog(
                                                      title:
                                                          Text("Escribe aqui"),
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        child: TextFormField(
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          controller:
                                                              _NormalrecordatorioController2,
                                                          cursorColor:
                                                              Colors.red,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Futura',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Recordatorio",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Futura',
                                                              color: Color
                                                                  .fromARGB(
                                                                      137,
                                                                      15,
                                                                      15,
                                                                      15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        // usually buttons at the bottom of the dialog
                                                        FlatButton(
                                                          child: new Text(
                                                              "Cancelar"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        FlatButton(
                                                          child: new Text(
                                                              "Guardar"),
                                                          onPressed: () {
                                                            // AQUI HAY QUE ACTUALIZAR
                                                            setState(() {
                                                              nuevoCampo2 =
                                                                  _NormalrecordatorioController2
                                                                      .text
                                                                      .trim();
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  nuevoCampo2,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: const BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
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
                    bottom: 3,
                    child: RaisedButton(
                      color: Colors.grey[700],
                      onPressed: () {
                        print("mas");
                        Navigator.push(
                          context,
                          TurnPageRoute(
                            overleafColor: Color.fromARGB(255, 226, 187, 187),
                            turningPoint: 0.2,
                            transitionDuration: const Duration(seconds: 1),
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: const Icon(Icons.add,
                          size: 15.0, color: Colors.white),
                      shape: CircleBorder(),
                    )),
                Positioned(
                    right: -20,
                    bottom: 3,
                    child: RaisedButton(
                      color: Colors.grey[700],
                      onPressed: () {
                        print("menos");
                      },
                      child: const Icon(Icons.remove,
                          size: 15.0, color: Colors.white),
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
      ),
    );
  }
}
