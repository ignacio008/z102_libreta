import 'dart:ui';

class Meeting {
  
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String calendarId;
  String eventId;
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,this.calendarId,this.eventId);
}