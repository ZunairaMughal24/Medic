// ignore: file_names
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/myappt.dart';

import 'home.dart';
import 'signup.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  var formkey = GlobalKey<FormState>();
  var isvalid = false;
  var isDoctor = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void login() async {
    String email = _emailController.text.trim();

    String password = _passwordController.text.trim();

    if (email == ("") || password == ("")) {
      // const SnackBar(content: Text("Please fill all the details!"));
      log("Please fill all the details!");
    }
    //create new account
    else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHome()));
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => isDoctor ? const myAppSc(isUser: false) : const MyHome()));
        }
      } catch (e) {
        if (e is TypeError) {
          log(e.toString());
        }
      }
      // ignore: unused_local_variable
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 146, 249, 254),
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
            Color.fromARGB(255, 146, 249, 254),
            Color.fromARGB(255, 195, 243, 242),
            Color.fromARGB(255, 214, 250, 255),
            Color.fromARGB(255, 146, 249, 254),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(scrollDirection: Axis.vertical, physics: const BouncingScrollPhysics(), children: [
            // ignore: sized_box_for_whitespace

            SizedBox(
              height: 240,
              width: 260,
              child: Image.asset(
                "assets/images/threedoctors.png",
                alignment: Alignment.topCenter,
              ),
            ),

            const Text(
              "Sign In ",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 7, 97, 137),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.justify,

                        validator: (value) {
                          if (value!.isEmpty) {
                            // SnackBar(content: Text("Please fill all the details!"));
                            return "enter your email";
                          }

                          return null;
                        },
                        // obscureText: true,

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 7, 97, 139),
                          ),
                        ),
                      ),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 230, 230, 230), width: 1.0),
                          borderRadius: BorderRadius.circular(17),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 201, 201, 201),
                                offset: Offset(03, 04),
                                blurRadius: 0.5,
                                spreadRadius: 0.2),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      // ignore: sort_child_properties_last

                      // ignore: sort_child_properties_last
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter your password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                          hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 7, 97, 137),
                          ),
                        ),
                      ),

                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 231, 231, 231), width: 1.0),
                          borderRadius: BorderRadius.circular(17),
                          color: const Color.fromARGB(255, 186, 231, 240),
                          // color: const Color.fromARGB(255, 253, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 201, 201, 201),
                                offset: Offset(03, 04),
                                blurRadius: 0.5,
                                spreadRadius: 0.2),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: SwitchListTile(
                  activeColor: const Color.fromARGB(255, 7, 97, 139),
                  title: const Text(
                    "Sign in as doctor",
                    style: TextStyle(color: Color.fromARGB(255, 7, 97, 137), fontSize: 15),
                  ),
                  value: isDoctor,
                  onChanged: (value) {
                    setState(() {
                      isDoctor = value;
                    });
                  }),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const signUpSc()),
                );
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: Color.fromARGB(255, 7, 97, 137), fontSize: 15),
                textAlign: TextAlign.right,
              ),
            ),

            // child: Text(
            //   "Forgot password?",
            //   style: TextStyle(
            //     color: Color.fromARGB(255, 7, 97, 139),
            //     fontSize: 15,
            //   ),
            //   textAlign: TextAlign.right,
            // ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 21, 97, 133), width: 1.0),
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 7, 97, 139),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 201, 201, 201),
                          offset: Offset(03, 04),
                          blurRadius: 0.5,
                          spreadRadius: 0.2),
                    ]),
                child: TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      login();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const MyHome()),
                      // );
                    }
                  },
                  child: const Text("Sign In",
                      style: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 254, 255, 255)),
                      textAlign: TextAlign.center),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const signUpSc()),
                );
              },
              child: const Text("Create a new account?",
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 7, 97, 139)),
                  textAlign: TextAlign.center),
            ),

            // children
          ]),
        ),
      ),
    );
  }
}
