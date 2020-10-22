import 'package:flutter/material.dart';

import 'home.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "English (India)",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[500],
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Instagram",
                style: TextStyle(
                  fontSize: 35,
                  color: Color(0xff262626),
                  fontFamily: 'Grandista',
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            SizedBox(
              height: 50,
              child: FlatButton(
                child: Text(
                  "Create New Account",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  print("new account");
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: FlatButton(
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.blue),
                ),
                color: Colors.transparent,
                onPressed: () {
                  print("login");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
