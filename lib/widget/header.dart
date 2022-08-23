import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  String nameSelecionado = "TODAY";
  String year = "YEAR";
  String month = "MONTH";
  String today = "TODAY";
  String notes = "NOTES";
  void changeIcon(String iconName) {
    setState(() {
      nameSelecionado = iconName;
    });
  }

  @override
  Widget build(BuildContext context) {
    
bool isMedia(BuildContext context)=> MediaQuery.of(context).size.width<278;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.17,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(Icons.favorite),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child:  Text(
                    "BOMBIN STUDIO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMedia(context)?15:20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(children: const [
                  Text(
                    "edit",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(Icons.ios_share),
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    changeIcon(year);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "YEAR",
                      style: TextStyle(
                        color: nameSelecionado == year
                            ? Colors.blue[900]
                            : Colors.blue[300],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeIcon(month);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      month,
                      style: TextStyle(
                        color: nameSelecionado == month
                            ? Colors.blue[900]
                            : Colors.blue[300],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeIcon(today);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      today,
                      style: TextStyle(
                        color: nameSelecionado == today
                            ? Colors.blue[900]
                            : Colors.blue[300],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeIcon(notes);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      notes,
                      style: TextStyle(
                        color: nameSelecionado == notes
                            ? Colors.blue[900]
                            : Colors.blue[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
