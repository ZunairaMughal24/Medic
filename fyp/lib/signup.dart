// ignore_for_file: unused_element

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'doctorsignup.dart';

import 'home.dart';

// ignore: camel_case_types
class signUpSc extends StatefulWidget {
  const signUpSc({super.key});

  @override
  State<signUpSc> createState() => _signUpScState();
}

// ignore: camel_case_types
class _signUpScState extends State<signUpSc> {
  var formkey = GlobalKey<FormState>();
  var isvalid = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _rPasswordController = TextEditingController();

  // ignore: non_constant_identifier_names
  void createAccount(String name, String password) async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String cPassword = _rPasswordController.text.trim();
    if (name == ("") || email == ("") || password == ("")) {
      log("Please fill all the details!");
    } else if (password != cPassword) {
      log("passwords do not match!");
    }

    //create new account
    else {
      // try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      //below written code worked,
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      });
      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.popUntil(context, (route) => route.isFirst);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHome()));
      }
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

        // ignore: prefer_const_constructors

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(scrollDirection: Axis.vertical, physics: const BouncingScrollPhysics(), children: [
            // ignore: sized_box_for_whitespace

            SizedBox(
              height: 220,
              width: 260,
              child: Image.asset(
                "assets/images/threedoctors.png",
                alignment: Alignment.topCenter,
              ),
            ),

            const Text(
              "Sign up",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 7, 97, 137),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),

            Form(
              key: formkey,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'name',
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
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      controller: _emailController,
                      onChanged: (value) {
                        if (value.contains("@gmail.com")) {
                          setState(() {
                            isvalid = true;
                          });
                        } else {
                          setState(() {
                            isvalid = false;
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your email";
                        }
                        return null;
                      },
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 7, 97, 139),
                        ),
                      ),
                    ),

                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
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
                  padding: const EdgeInsets.only(top: 6),
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
                      obscureText: false,
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
                        color: const Color.fromARGB(255, 253, 255, 255),
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
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    // ignore: sort_child_properties_last

                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      controller: _rPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "re-type the password";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'confirm password',
                        hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 7, 97, 139),
                        ),
                      ),
                    ),

                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 227, 227, 227), width: 1.0),
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
              ]),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 7, 97, 139), width: 1.0),
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
                      createAccount(_nameController.text.trim(), _passwordController.text.trim());
                    }
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 254, 255, 255)),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 7, 97, 139), width: 1.0),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DocSignUp()));
                  },
                  child: const Text("Sign up as doctor",
                      style: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 254, 255, 255)),
                      textAlign: TextAlign.center),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Already have an account?",
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
