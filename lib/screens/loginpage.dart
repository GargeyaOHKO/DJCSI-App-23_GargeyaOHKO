//import 'dart:html';
import 'package:app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool cb = false;

  /*Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<User?> logingUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

   Widget build(BuildContext context){*/

  /*return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return LoginPage();
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
*/

  final _fk = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_fk.currentState!.validate()) {
      setState(() {
        cb = true;
      });
      await Future.delayed(Duration(milliseconds: 400));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        cb = false;
      });
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    /*TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();*/

    // ignore: prefer_typing_uninitialized_variables
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _fk,
          child: Column(
            children: [
              /*Image.asset(
                "assets/images/undraw_Sign_up_n6im.png",
                fit: BoxFit.cover,
              ),*/

              /*FutureBuilder(
                future: _initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LoginPage();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),*/
              SizedBox(
                height: 80,
              ),
              Text(
                "Welcome back to",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              Text(
                "FocusList!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Column(
                  children: [
                    TextFormField(
                        //controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              //backgroundColor: Colors.lightBlue,
                            )),
                        validator: (value) {
                          if (value == "") {
                            return "Email cannot be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                        //controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.black,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              //backgroundColor: Colors.lightBlue
                            )),
                        validator: (value) {
                          if (value == "") {
                            return "Password cannot be Empty";
                          } else if (value!.length < 6) {
                            return "Password length should be atleast 6";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.signuppageRoute);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                backgroundColor: Colors.transparent,
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                
                              ),
                              
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.centerLeft,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        /*async {
                          setState(() {
                            cb = true;
                          });
                          await Future.delayed(Duration(milliseconds: 400));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);*/

                        /*(User? user = await logingUsingEmailPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context);
                          print(user);
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => moveToHome(context)));
                          }
                        },*/
                        //onHover:
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          alignment: Alignment.center,
                          width: cb ? 60 : 150,
                          height: 35,
                          child: cb
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                        ),
                      ),
                    ),

                    /*ElevatedButton(
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 35)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                        print("Hello User");
                      },
                    ),*/
                    SizedBox(
                      height: 0,
                    ),
                    Image.asset(
                      "assets/images/6310507.png",
                      fit: BoxFit.cover,
                      height: 390,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
