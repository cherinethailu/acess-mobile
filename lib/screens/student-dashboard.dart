import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffc2e7e7),
        ),
        body: Container(
            child: SfCalendar(
          view: CalendarView.month,
          dataSource: null,
        )));
  }
}
