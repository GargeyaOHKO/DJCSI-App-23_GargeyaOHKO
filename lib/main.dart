import 'package:app/screens/firstpage.dart';
import 'package:app/screens/loginpage.dart';
import 'package:app/screens/signuppage.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Colors.transparent));
    return MaterialApp(
      //home: Home(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          //Color selection = Colors.green[400]!;
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => FirstPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signuppageRoute: (context) => SignupPage(),
        MyRoutes.homeRoute: (context) => Home(),
       
      },
    );
  }
}
