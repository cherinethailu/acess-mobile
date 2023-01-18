import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class InstructorDashboard extends StatefulWidget {
  @override
  _InstructorDashboardState createState() => _InstructorDashboardState();
}

class _InstructorDashboardState extends State<InstructorDashboard> {
  CalendarView _calendarView = CalendarView.day;
  String viewTitle = "Class Schedule";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop();
            },
            
            //label: Text("Sign out"),
            color: Colors.red,
          ),
        ],
        backgroundColor: Color(0xffc2e7e7),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          Text(
            "Class Schedule",
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 20),
          Container(
            width: 400,
            height: 550,
            child: 
            SfCalendar(
              firstDayOfWeek: 1,
              allowedViews: [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month,
                CalendarView.schedule
              ],
              showNavigationArrow: true,
              showCurrentTimeIndicator: true,
              cellBorderColor: Colors.blueGrey,
              headerHeight: 40,
              showDatePickerButton: true,
              showWeekNumber: true,
              timeZone: 'EAT',
              todayHighlightColor: Color.fromARGB(0, 96, 121, 91),
              view: CalendarView.schedule,
            ),
          ),
        ]),
      )),
    );
  }
}
