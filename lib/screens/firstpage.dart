import 'dart:convert';
import 'dart:ui';

import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "FocusList",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/3327598.png",
              fit: BoxFit.cover,
              height: 350,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Welcome to FocusList",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "FocusList will help you stay\norganized and perform your\n          tasks much faster.",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 22),
                )),
          ],
        ),
      ),
    );
  }
}
