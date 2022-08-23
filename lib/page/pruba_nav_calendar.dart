import 'dart:collection';

// import 'package:device_calendar/device_calendar.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:z102_libreta/models/meeting_description_calen_model.dart';

class PruebaNavCalenadar extends StatefulWidget {
  PruebaNavCalenadar({Key? key}) : super(key: key);

  @override
  State<PruebaNavCalenadar> createState() => _PruebaNavCalenadarState();
}

class _PruebaNavCalenadarState extends State<PruebaNavCalenadar> {

//  late List<UnmodifiableListView<Event>> calEventsList;
//   late List<Calendar> calendars;
//  DeviceCalendarPlugin _deviceCalendarPlugin = new DeviceCalendarPlugin();
// getUsersCalendar() async{
//   try{
//     var permissionGranted = await _deviceCalendarPlugin.hasPermissions();
//     if(permissionGranted.isSuccess && !permissionGranted.data!){

//     permissionGranted = await _deviceCalendarPlugin.requestPermissions();

//     if(!permissionGranted.isSuccess || !permissionGranted.data!){
//      return;
//    }
//   }

//  final startDate = DateTime.now().add(Duration(days: 1));
//  final endDate = DateTime.now().add(Duration(days: 2));
// final List<Meeting> meetings = <Meeting>[];

//  final calResult = await _deviceCalendarPlugin.retrieveCalendars();
//  print("imprimi ${calResult.data!}");
//  calendars = calResult.data!;
//  for(int i = 0; i < calendars.length; i++){
//   final calEvents = await _deviceCalendarPlugin.retrieveEvents(calendars[i].id, RetrieveEventsParams(startDate: startDate, endDate: endDate));
//   calEventsList.add(calEvents.data!);
 
// }}

// catch(e){
// print(e);
// }
//  print("imprimes ${calEventsList}");
// }
Event buildEvent({Recurrence? recurrence}) {
    return Event(
      title: 'Test eventeee',
      description: 'example',
      location: 'Flutter app',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(minutes: 30)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: AndroidParams(
        emailInvites: ["ortizignacio008@gmail.com"],
      ),
      recurrence: recurrence,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    // getUsersCalendar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add event to calendar example'),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Add normal event'),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.addEvent2Cal(
                  buildEvent(),
                );
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Add event with recurrence 1'),
              subtitle: const Text("weekly for 3 months"),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.addEvent2Cal(buildEvent(
                  recurrence: Recurrence(
                    frequency: Frequency.weekly,
                    endDate: DateTime.now().add(Duration(days: 60)),
                  ),
                ));
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Add event with recurrence 2'),
              subtitle: const Text("every 2 months for 6 times (1 year)"),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.addEvent2Cal(buildEvent(
                  recurrence: Recurrence(
                    frequency: Frequency.monthly,
                    interval: 2,
                    ocurrences: 6,
                  ),
                ));
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Add event with recurrence 3'),
              subtitle:
                  const Text("RRULE (android only) every year for 10 years"),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.addEvent2Cal(buildEvent(
                  recurrence: Recurrence(
                    frequency: Frequency.yearly,
                    rRule: 'FREQ=YEARLY;COUNT=10;WKST=SU',
                  ),
                ));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}