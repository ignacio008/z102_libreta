

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:toast/toast.dart';

import '../models/meetingDataSource_description.dart';
import '../models/meeting_description_calen_model.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  
  final List<Meeting> meetings = <Meeting>[];
  DateTime horaActual=DateTime.now();
   late TimeOfDay _selectedDateSalida= TimeOfDay(hour: horaActual.hour, minute: horaActual.minute);
   TextEditingController _textEditingController = TextEditingController();
   TextEditingController _textEditingControllerDescription = TextEditingController();
   
     DateTime? _textoPruebaMioSalida;

  @override
  Widget build(BuildContext context) {
    
    return 
       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
        ),
         child: SfCalendar(
           view: CalendarView.month,
           minDate:DateTime.now(),
           viewNavigationMode :ViewNavigationMode.snap,
           initialSelectedDate: DateTime.now(),
           backgroundColor:Colors.grey[100],
           cellBorderColor:Colors.grey[600],
           showNavigationArrow :true,
           showDatePickerButton :true,
           onLongPress: (detail){
             print("estoy presionando");
             print(detail.date);
             showModalBottomSheet(
               context: context, builder:(context) => WidgetDescription(context, detail),
             );
           },
           onTap: (detail){
           _calendarioShow(context, detail);
           DateTime hoy=DateTime.now();
           },
           dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: const MonthViewSettings(
         appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
         ),
       );
    
  }
  
  void _calendarioShow(BuildContext context, CalendarTapDetails detail) {
    DateTime hoy=DateTime.now();
    DateTime fechaSelect = detail.date!;
   
      showDialog(context: context,builder:(BuildContext context) {
      return showDialogLastDate(context,detail);
        },
      );
    }
           
  
   
   
   

    Widget showDialogLastDate (BuildContext context,CalendarTapDetails detail) {
    return AlertDialog(
             title:
               const Text("Por favor acomplete los siguientes campos"),
               content: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height *0.24,
                     child:  Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                           textInputAction:TextInputAction.done,
                           controller:_textEditingControllerDescription,
                           cursorColor: Colors.red,
                           style:const TextStyle(
                           fontFamily:  'Futura',
                           color: Color.fromARGB(255,0,0,0),
                                                          ),
                           decoration:InputDecoration(
                                       hintText:"Descripcion",
                                       border:OutlineInputBorder(
                                         borderRadius:BorderRadius .circular( 10.0),
                                                            ),
                                          hintStyle:const TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Futura',
                                            color: Color.fromARGB(137, 15,15,15),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height:10),
                          Text("Seleccione su hora"),
                          TextFormField(
                                  onTap:(){
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                
                 _selectDateSalida(context,_selectedDateSalida);
                                  },
                        controller: _textEditingController,
                              keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        prefixIcon: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${_selectedDateSalida.hour==null?_selectedDateSalida.hour:_selectedDateSalida.hour} : ${_selectedDateSalida.minute==null?_selectedDateSalida.minute:_selectedDateSalida.minute} ${_selectedDateSalida.hour<12? "AM": "PM"} "),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          // if(value.isEmpty){
                                          //   return "El campo esta vacio";
                                          // }
                                        }
                                        ),
                        ],
                      ),
                     ),),
            actions: <Widget>[
              FlatButton(
                 child: const Text("Cancelar"),
                    onPressed: () async{
                      print(detail.resource);
                      Navigator.pop(context);
                },
              ),
              FlatButton(
                 child: const Text("Guardar", style:TextStyle(
                  color:Colors.blue
                 )),
                    onPressed: () async{
                      print("fecha de hoy es ${detail.date}");
                       
                      agregarRecordatorio(context,detail);
                      Navigator.pop(context);
                },
              ),
              
          ],
        );
    }
     List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day+1, 4,30);
    final DateTime startTime2 = DateTime(today.year, today.month, today.day+1, 6,30);
    final DateTime endTime = startTime.add(const Duration(hours: 3));
    // meetings.add(Meeting(
    //     'Recordatorio de uso', startTime, endTime, Color.fromARGB(255, 250, 103, 6), false));
    //      meetings.add(Meeting(
    //     'Recordatorio de usoss', startTime2, endTime, Color.fromARGB(255, 250, 103, 6), false));
    return meetings;
  }
  
  //Agregar
   agregarRecordatorio(BuildContext context, CalendarTapDetails detail) {  
        String _description = _textEditingControllerDescription.text.trim();
        final DateTime today = DateTime.now();
        final DateTime startTime = DateTime(detail.date!.year, detail.date!.month, detail.date!.day, _textoPruebaMioSalida==null?12:_textoPruebaMioSalida!.hour,_textoPruebaMioSalida==null?00: _textoPruebaMioSalida!.minute);
        final DateTime endTime = startTime.add(const Duration(hours: 2));
       

            setState(() {        
        meetings.add(Meeting(
            '${_description.isEmpty?"Recordatorio":_description }', startTime, endTime, const Color(0xFF0F8644), false));
            });
             final Event newEvent = Event(
        title: "${_description.isEmpty?"Recordatorio":_description }",
        description: "${_description.isEmpty?"Recordatorio":_description }",
        location: "Horario",
        startDate: startTime,
        endDate: endTime.add(
          const Duration(hours: 2),
        ),
      );
      Add2Calendar.addEvent2Cal(newEvent,);               
  }
void _selectDateSalida(BuildContext context, TimeOfDay selectday)  async {
      FocusScope.of(context).requestFocus(FocusNode());
          TimeOfDay? newSelectedDate = await showTimePicker(context: context, initialTime: _selectedDateSalida != null ? _selectedDateSalida : TimeOfDay.now(), 
            );
      if (newSelectedDate != null) {
      _selectedDateSalida=newSelectedDate;
      DateTime _textoPruebaSalida= DateTime(2010,2,2,newSelectedDate.hour,newSelectedDate.minute);
      _textoPruebaMioSalida=_textoPruebaSalida;
 }
  }
  
  Widget WidgetDescription(BuildContext context, CalendarLongPressDetails    detail){
    DateTime fechaNueva=detail.date!;
      return SfCalendar(
        view: CalendarView.timelineDay,
        minDate:fechaNueva,
         initialSelectedDate: fechaNueva,
              backgroundColor:Colors.black12,
              cellBorderColor:Colors.white,
              showNavigationArrow :true,
              showDatePickerButton :true,
        dataSource:MeetingDataSource(_getDataSource()),
        onTap:(detail){
          Navigator.pop(context);
           showDialog(context: context,builder:(BuildContext context) {
      return showDialogEdit(context,detail);
        },
      );
        },
      );
   }
   Widget showDialogEdit (BuildContext context,CalendarTapDetails detail) {
    return AlertDialog(
             title:
               const Text("Por favor acomplete los siguientes campos"),
               content: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height *0.24,
                     child:  Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      TextFormField(
                        textInputAction:TextInputAction.done,
                        controller:_textEditingControllerDescription,
                        cursorColor: Colors.red,
                        style:const TextStyle(
                        fontFamily:  'Futura',
                        color: Color.fromARGB(255,0,0,0),
                                                      ),
                        decoration:InputDecoration(
                                    hintText:"Descripcion",
                                    border:OutlineInputBorder(
                                      borderRadius:BorderRadius .circular( 10.0),
                                                        ),
                                      hintStyle:const TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Futura',
                                        color: Color.fromARGB(137, 15,15,15),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height:10),
                    Text("Seleccione su hora"),
                    TextFormField(
                      onTap:(){
                        FocusScope.of(context).requestFocus(new FocusNode());
                      _selectDateSalida(context,_selectedDateSalida);
                      },
                        controller: _textEditingController,
                        keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                            prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                                ), // icon is 48px widget.
                              ),
                                  labelText: "${_selectedDateSalida.hour==null?_selectedDateSalida.hour:_selectedDateSalida.hour} : ${_selectedDateSalida.minute==null?_selectedDateSalida.minute:_selectedDateSalida.minute} ${_selectedDateSalida.hour<12? "AM": "PM"} "),
                                  onChanged:(value){
                                  },
                                    validator:(value){
                                    // if(value.isEmpty){
                                    //   return "El campo esta vacio";
                                    // }
                                  }
                                  ),
                        ],
                      ),
                     ),),
            actions: <Widget>[
              FlatButton(
                 child: const Text("Cancelar"),
                    onPressed: () async{
                      print(detail.resource);
                      Navigator.pop(context);
                },
              ),
               FlatButton(
                 child: const Text("Eliminar", style:TextStyle(
                  color:Colors.red
                 )),
                    onPressed: () async{
                      final event = detail.appointments!.first;
                      eliminarRecordatorios(event);
                      Navigator.pop(context);
                },
              ),
              FlatButton(
                 child: const Text("Guardar", style:TextStyle(
                  color:Colors.blue
                 )),
                    onPressed: () async{
                      print("fecha de hoy es ${detail.date}");
                      final event = detail.appointments!.first;
                      DateTime hoy = DateTime.now();
                      String _description = _textEditingControllerDescription.text.trim();
                      final DateTime today = DateTime.now();
                      final DateTime startTime = DateTime(detail.date!.year, detail.date!.month, detail.date!.day, _textoPruebaMioSalida==null?12:_textoPruebaMioSalida!.hour,_textoPruebaMioSalida==null?00: _textoPruebaMioSalida!.minute);
                      final DateTime endTime = startTime.add(const Duration(hours: 2));
          setState(() {    
            if(meetings.isNotEmpty){
              final newEvent=Meeting(
                "${_description.isEmpty?"Recordatorio":_description}", startTime, endTime,const Color(0xFF0F8644), false,
              );
              editEvento(newEvent, event);
               Navigator.pop(context);
            }
              });
                },
              ),
          ],
        );
    }
   //Editar
     void editEvento(Meeting newEvent, Meeting event) {
      final index = meetings.indexOf(event);
      setState(() {
        meetings[index]=newEvent;
      });
     }
       void eliminarRecordatorios(Meeting event) {
         setState(() {
            meetings.remove(event);
            });
       }
            
         
   
     
   
    
















}

