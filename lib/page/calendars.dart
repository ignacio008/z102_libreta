

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:toast/toast.dart';

import '../models/meetingDataSource_description.dart';
import '../models/meeting_description_calen_model.dart';
// import 'package:add_2_calendar/add_2_calendar.dart';
// import 'package:device_calendar/device_calendar.dart';
import 'package:timezone/timezone.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';


class Calendars extends StatefulWidget {
  Calendars({Key? key}) : super(key: key);

  @override
  State<Calendars> createState() => _CalendarState();
}

class _CalendarState extends State<Calendars> {
  
  final List<Meeting> meetings = <Meeting>[];
  DateTime horaActual=DateTime.now();
   late TimeOfDay _selectedDateSalida= TimeOfDay(hour: horaActual.hour, minute: horaActual.minute);
   TextEditingController _textEditingController = TextEditingController();
   TextEditingController _textEditingControllerDescription = TextEditingController();
   
     DateTime? _textoPruebaMioSalida;
    // final _deviceCalendarPlugin = new DeviceCalendarPlugin();
final CalendarPlugin _deviceCalendarPlugin = CalendarPlugin();
  // CalendarPageState() {
  //   _deviceCalendarPlugin = new DeviceCalendarPlugin();
  // }
  //  void _retrieveCalendars() async {
  //   try {
  //     var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
  //     if (permissionsGranted!.isSuccess && !permissionsGranted.data!) {
  //       permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
  //       if (!permissionsGranted.isSuccess || !permissionsGranted.data!) {
  //         return;
  //       }
  //     }

  //     final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
  //     setState(() {
  //       _calendars = calendarsResult.data as List<Calendar>;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
   Future<List<Calendar>?> _fetchCalendars() async {
    _deviceCalendarPlugin.hasPermissions().then((value) {
      if (!value!) {
        _deviceCalendarPlugin.requestPermissions();
      }
    });

    return _deviceCalendarPlugin.getCalendars();
  }
@override
  void initState() {
    // TODO: implement initState
    // _retrieveCalendars();
    // CalendarPageState();
    _fetchCalendars();
    super.initState();
  }
  
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
   agregarRecordatorio(BuildContext context, CalendarTapDetails detail) async {  
        
        final DateTime today = DateTime.now();
        final DateTime startTime = DateTime(detail.date!.year, detail.date!.month, detail.date!.day, _textoPruebaMioSalida==null?12:_textoPruebaMioSalida!.hour,_textoPruebaMioSalida==null?00: _textoPruebaMioSalida!.minute);
        final DateTime endTime = startTime.add(const Duration(hours: 2));

        Location _currentLocation = getLocation('America/Chihuahua');
        final detroit = getLocation('America/Detroit');
       final TZDateTime start=TZDateTime.now(detroit);
       final TZDateTime startTimeNew=TZDateTime(_currentLocation,detail.date!.year, detail.date!.month, detail.date!.day, _textoPruebaMioSalida==null?12:_textoPruebaMioSalida!.hour,_textoPruebaMioSalida==null?00: _textoPruebaMioSalida!.minute);
       final TZDateTime endTimeNew=startTimeNew.add(const Duration(hours: 2));
            setState(() {              
            });
         
  
   _addEvent(startTime, endTime);
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
                "${_description.isEmpty?"Recordatorio":_description}", startTime, endTime,const Color(0xFF0F8644), false,"1","265"
              );
              editEvento(newEvent, event,startTime,endTime);
               Navigator.pop(context);
            }
              });
                },
              ),
          ],
        );
    }
   //Editar
     void editEvento(Meeting newEvent, Meeting event,DateTime start, DateTime end) {
       String _description = _textEditingControllerDescription.text.trim();
      final index = meetings.indexOf(event);
      CalendarEvent _newEvent = CalendarEvent(
      title: '${_description.isEmpty?"Recordatorio":_description }',
      description: '${_description.isEmpty?"Recordatorio":_description }',
      startDate: start,
      endDate: end,
      location: 'Merida, Yucatan',
      url: 'https://www.google.com',
      attendees: Attendees(
        attendees: [
          Attendee(emailAddress: 'test1@gmail.com', name: 'Test1'),
          Attendee(emailAddress: 'test2@gmail.com', name: 'Test2'),
        ],
      ),
    );
   
    _deviceCalendarPlugin
        .updateEvent(calendarId: event.calendarId, event: _newEvent)
        .then((eventId) {
      debugPrint('${event.eventId} is updated to $eventId');
    });
      setState(() {
        meetings[index]=newEvent;
      });
      
       _deviceCalendarPlugin
        .deleteEvent(calendarId: event.calendarId, eventId: event.eventId)
        .then((isDeleted) {
      debugPrint('Is Event deleted: $isDeleted');
    });
     }




       void eliminarRecordatorios(Meeting event)async {
         _deviceCalendarPlugin
        .deleteEvent(calendarId: event.calendarId, eventId: event.eventId)
        .then((isDeleted) {
      debugPrint('Is Event deleted: $isDeleted');
    });
         setState(() {
            meetings.remove(event);
            });
       }
            
         
   
     
   
    









void _addEvent(DateTime start, DateTime end) async {
  String _description = _textEditingControllerDescription.text.trim();
    CalendarEvent _newEvent = CalendarEvent(
      title: '${_description.isEmpty?"Recordatorio":_description }',
      description: '${_description.isEmpty?"Recordatorio":_description }',
      startDate: start,
      endDate: end,
      location: 'Merida, Yucatan',
      url: 'https://www.google.com',
      attendees: Attendees(
        attendees: [
          Attendee(emailAddress: '@gmail.com', name: 'Test1'),
          Attendee(emailAddress: '@gmail.com', name: 'Test2'),
        ],
      ),
    );
    _deviceCalendarPlugin
        .createEvent(calendarId: "1", event: _newEvent)
        .then((evenId) {
      setState(() {
         meetings.add(Meeting(
      '${_description.isEmpty?"Recordatorio":_description }', start, end, const Color(0xFF0F8644), false,"1","${evenId}"));
        print('el id es: $evenId');
      });
    });
    // print(widget.calendarId);
  }






}
