import 'package:acess_mobile/splash-screen/splash-screen-2.dart';
import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);
  final String route = "student";

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  static final List<String> options = [
    'Student',
    'Instructor',
  ];
  static final List<String> collegesList = [
    'Electrical and Mechanical Engineering',
    'Architecture and Civil Engineering',
    'Biology and Chemical Engineering',
    'Social Sciences',
    'Applied Sciences',
  ];
  static final List<String> departmentList = [
    'Student',
    'Instructor',
  ];
  static final List<String> sectionsList = [
    'Student',
    'Instructor',
  ];
  final _formKey = GlobalKey<FormState>();
  String currentOption = "";
  String initial = collegesList.first.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Select Form"),
        backgroundColor: Colors.black12,
        actions: [
          DropdownButton(
            value: initial,
            items: options.map((String option) {
              return DropdownMenuItem(
                value: option,
                child: Text('$option'),
              );
            }).toList(),
            hint: Text("You\'re: "),
            onChanged: (String? option) {
              setState(() {
                initial = option!;
                switch (initial) {
                  case 'Student':
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Student()));
                    break;
                  case 'Instructor':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen2()));
                    break;
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: Color(0xffc2e7e7),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/teaching.jpg"),
              // fit: BoxFit.fitWidth,

              alignment: Alignment.center),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //     padding: EdgeInsets.all(10),
              //     child: Stack(
              //         alignment: const Alignment(0, 0),
              //         children: <Widget>[
              //           Container(
              //               decoration: BoxDecoration(
              //                 color: Colors.blueGrey[100],
              //                 borderRadius: BorderRadius.circular(30.0),
              //               ),
              //               child: Padding(
              //                   padding: EdgeInsets.only(
              //                       left: 15, right: 15, top: 5),
              //                   child: TextFormField(
              //                       obscureText: true,
              //                       decoration: InputDecoration(
              //                         border: InputBorder.none,
              //                         labelText: 'Your password',
              //                       )))),
              //         ])),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: DropdownButton(
                                  value: initial,
                                  items: options.map((String option) {
                                    return DropdownMenuItem(
                                      value: option,
                                      child: Text(
                                        "$option",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      initial = value!;
                                    });
                                  },
                                ))),
                      ])),
              DropdownButton(
                value: initial,
                items: collegesList.map((String option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(
                      "$option",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  initial = value!;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
