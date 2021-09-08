import 'dart:async';

import 'package:acess_mobile/authentication/teacher-login.dart';
import 'package:acess_mobile/constants/constants.dart';
import 'package:acess_mobile/screens/student-dashboard.dart';
import 'package:acess_mobile/splash-screen/splash-screen-2.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);
  final String route = "student";

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  static final List<String> options = [
    'Student',
    'Instructor',
  ];
  bool value = true;
  static final List<String> collegesList = Constants.collegesList;
  static final List<String> departmentList = Constants.cemeDepartmentList;
  static final List<String> sectionsList = Constants.sectionsList;
  final _studentFormKey = GlobalKey<FormState>();
  String currentOption = "";
  String initial = options.first.toString();
  String initialCollege = collegesList.first.toString();
  String initialDepartment = departmentList.first.toString();
  String initialSection = sectionsList.first.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Select Form"),
        backgroundColor: Colors.black12,
        leading: Icon(Icons.navigate_before),
        actions: [
          DropdownButton(
            hint: Text("You\'re: "),
            value: initial,
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text('$option'),
              );
            }).toList(),
            onChanged: (String? option) {
              setState(() {
                initial = option!;
              });
              setState(() {
                switch (initial) {
                  case 'Student':
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Student()));
                    break;
                  case 'Instructor':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherLogin()));
                    break;
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: Color(0xffc2e7e7),
      body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       //image: AssetImage("assets/images/teaching.jpg"),
          //       // fit: BoxFit.fitWidth,
          //       alignment: Alignment.center),
          // ),
          child: Form(
              key: _studentFormKey,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: 20),
                      Image.asset("assets/images/student-class.jpg"),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[100],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: DropdownButton(
                                        //elevation: 20,
                                        dropdownColor: Colors.blueGrey,
                                        isExpanded: true,
                                        value: initialCollege,
                                        items: collegesList.map((option) {
                                          return DropdownMenuItem(
                                            value: option,
                                            child: Text('$option'),
                                          );
                                        }).toList(),
                                        hint: Text("Your College"),
                                        onChanged: (String? option) {
                                          setState(() {
                                            initialCollege = option!;
                                          });
                                        },
                                        autofocus: true,
                                      ),
                                    )),
                              ])),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[100],
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: DropdownButton(
                                        focusColor: Colors.grey,
                                        dropdownColor: Colors.blueGrey,
                                        isExpanded: true,
                                        value: initialDepartment,
                                        items: departmentList.map((option) {
                                          return DropdownMenuItem(
                                            value: option,
                                            child: Text('$option'),
                                          );
                                        }).toList(),
                                        hint: Text("Your Department"),
                                        onChanged: (String? option) {
                                          setState(() {
                                            initialDepartment = option!;
                                          });
                                        },
                                      ),
                                    )),
                              ])),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                              alignment: Alignment(0, 0),
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[100],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: DropdownButton(
                                        focusColor: Colors.grey,
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        value: initialSection,
                                        items: sectionsList.map((option) {
                                          return DropdownMenuItem(
                                            value: option,
                                            child: Text('$option'),
                                          );
                                        }).toList(),
                                        hint: Text("Your Section"),
                                        onChanged: (String? option) {
                                          setState(() {
                                            initialSection = option!;
                                          });
                                        },
                                      ),
                                    )),
                              ])),
                      SizedBox(height: 20),

                      SizedBox(height: 20),
                      RoundedLoadingButton(
                        //key: _studentFormKey,
                        controller: controller,
                        duration: Duration(seconds: 3),

                        onPressed: () async {
                          print("Initial college: " + initialCollege);
                          print("Initial department: " + initialDepartment);
                          print("Initial section: " + initialSection);
                          print(value);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentDashboard()));
                          controller.reset();
                        },
                        child: Text('Get Schedule'),
                        color: Colors.green,
                      ),
                      SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              //key: _studentFormKey,
                              value: value,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value = value!;
                                  print(this.value);
                                });
                              },
                            ),
                            Text("Remember Me"),
                          ])
                      // )
                    ],
                    // ),
                    // ),
                    // ]
                  ),
                ),
              ))),
    );
  }
}
