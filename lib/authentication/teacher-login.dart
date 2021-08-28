import 'dart:async';

import 'package:acess_mobile/screens/student-select.dart';
import 'package:acess_mobile/splash-screen/splash-screen-2.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TeacherLogin extends StatefulWidget {
  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

TextEditingController textController = new TextEditingController();

class _TeacherLoginState extends State<TeacherLogin> {
  static final List<String> options = [
    'Student',
    'Instructor',
  ];
  String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String initial = options[1].toString();
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instructor Login"),
          backgroundColor: Colors.black12,
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
        body: Form(
          key: _formKey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 400,
                    child: Image.asset("assets/images/login.jpg"),
                  ),
                  // SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  validator: (value) {
                                    if (RegExp(emailRegExp).hasMatch(value!)) {
                                      return null;
                                    } else
                                      return 'Email not valid';
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  //controller: textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Email',
                                  ))))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Stack(alignment: const Alignment(0, 0), children: <
                          Widget>[
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value!.length < 8) {
                                        return 'Password cannot be less than 8 characters long';
                                      } else
                                        return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    //controller: textController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Your password',
                                    )))),
                      ])),
                  SizedBox(height: 20),
                  ElevatedButton(
                    //controller: controller,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Wonderfully validated!");
                        Timer(
                            Duration(seconds: 3),
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Student())));
                      } else
                        return;
                    },
                    child: Text('Log In'),

                    //color: Colors.green[10],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
