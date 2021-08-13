import 'dart:async';
// import 'dart:html';
import 'package:acess_mobile/screens/student-select.dart';
import 'package:acess_mobile/splash-screen/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController controller =
        RoundedLoadingButtonController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc2e7e7),
      ),
      backgroundColor: Color(0xffc2e7e7),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset("assets/images/schedule.jpg"),
            height: 350,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(5.0, 10.0),
                  blurRadius: 20.0,
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Text(
            "ACESS - Your Scheduler!",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.lightGreenAccent[50]),
          ),
          SizedBox(height: 50),
          RoundedLoadingButton(
            child: Text(
              'Get Started!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            color: Color(0xffc2e7e7),
            successColor: Colors.green,
            borderRadius: 20,
            elevation: 20,
            onPressed: () async {
              Timer(
                  Duration(seconds: 3),
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Student())));
            },
            controller: controller,
          )
        ],
      )),
    );
  }
}
