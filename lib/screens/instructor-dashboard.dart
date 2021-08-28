import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class InstructorDashboard extends StatefulWidget {
  @override
  _InstructorDashboardState createState() => _InstructorDashboardState();
}

class _InstructorDashboardState extends State<InstructorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: SfCalendar()),
    );
  }
}
