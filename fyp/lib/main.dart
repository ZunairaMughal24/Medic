import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp/home.dart';
import 'package:fyp/myappt.dart';
import 'package:fyp/signIn.dart';
// ignore: unused_import
import 'appointment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'final project',
      options: const FirebaseOptions(
          appId: '1:201017378885:android:91bb9b88ca8b98e9f47b2c',
          apiKey: 'AIzaSyBaPOGgycLamuvQVXfEc53usmrlIB8Tc3w',
          messagingSenderId: '201017378885',
          projectId: 'final-project-e6c97'));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Medic",
    theme: ThemeData(
      fontFamily: "regular",
    ),
    home: const MyProject(),
  ));
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});
  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  void initState() {
    super.initState();
    gotonextscreen();
  }

  gotonextscreen() async {
    Timer(const Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser != null) {
        FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
          if (value.exists) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHome()));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const myAppSc(isUser: false)));
          }
        });
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const logIn()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 146, 249, 254),
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
          Color.fromARGB(255, 146, 249, 254),
          Color.fromARGB(255, 195, 243, 242),
          Color.fromARGB(255, 214, 250, 255),
          Color.fromARGB(255, 146, 249, 254),
        ]),
//
      ),
      child: Column(
        children: [
          const SizedBox(height: 270),
          Image.asset(
            "assets/images/applogo.png",
            height: 90,
            width: 90,
          ),
          const SizedBox(height: 10),
          const Text(
            "Medic",
            style: TextStyle(
                color: Color.fromARGB(255, 7, 97, 139),
                fontSize: 25,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              // Color.fromARGB(255, 252, 252, 252),
              Color.fromARGB(255, 7, 97, 139),
            ),
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}
