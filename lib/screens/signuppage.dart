import 'package:app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = "";
  bool cb = false;

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

 
  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _fk,
          child: Column(
            children: [
              
              SizedBox(
                height: 45,
              ),
              Text(
                "Get things done\n        with FocusList!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let's help you meet up your tasks",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Column(
                  children: [
                    TextFormField(
                        
                        decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              //backgroundColor: Colors.lightBlue,
                            )),
                        validator: (value) {
                          if (value == "") {
                            return "Name cannot be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                        
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
                        
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Icon(
                              Icons.lock_person,
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
                    TextFormField(
                        
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.black,
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              //backgroundColor: Colors.lightBlue
                            )),
                        validator: (value) {
                          if (value == "") {
                            return "Re-enter Your Password";
                          } else if (value!.length < 6) {
                            return "Password length should be atleast 6";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                       
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
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                        ),
                      ),
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
