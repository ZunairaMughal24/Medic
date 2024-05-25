import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/description.dart';
import 'package:fyp/myappt.dart';

class DocSignUp extends StatefulWidget {
  const DocSignUp({super.key});

  @override
  State<DocSignUp> createState() => _DocSignUpState();
}

class _DocSignUpState extends State<DocSignUp> {
  var formkey = GlobalKey<FormState>();
  var isvalid = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rPasswordController = TextEditingController();
  final TextEditingController _specialityController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _servicesController = TextEditingController();

  // ignore: non_constant_identifier_names
  void createAccount(String name, String password) async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String cPassword = _rPasswordController.text.trim();
    String speciality = _specialityController.text.trim();
    String experience = _experienceController.text.trim();
    String number = _numberController.text.trim();
    String location = _locationController.text.trim();
    String availability = _availabilityController.text.trim();
    String services = _servicesController.text.trim();

    if (name == ("") ||
        email == ("") ||
        password == ("") ||
        cPassword == ("") ||
        speciality == ("") ||
        experience == ("") ||
        number == ("") ||
        location == ("") ||
        availability == ("") ||
        services == ("")) {
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
      await FirebaseFirestore.instance.collection('doctors').doc(userCredential.user!.uid).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "speciality": _specialityController.text.trim(),
        "experience": _experienceController.text.trim(),
        "number": _numberController.text.trim(),
        "location": _locationController.text.trim(),
        "availability": _availabilityController.text.trim(),
        "services": _servicesController.text.trim(),
      });
      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.popUntil(context, (route) => route.isFirst);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const myAppSc(isUser: false)));
        //   }
        // } catch (e) {
        //   if (e is TypeError) {
        //     log(e.toString());
        //   }
      }
      // ignore: unused_local_variable
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 252),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        title: const Text(
          "Doctor Sign up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Name",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      hintText: "Enter your name",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Email",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Password",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Confirm password",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _rPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "re-type the password",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Speciality",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _specialityController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your speciality";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mention your speciality",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Experience",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _experienceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your experience";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your work experience",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Contact number",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your number";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter number",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Location",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _locationController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your location";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter location",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Availability",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _availabilityController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your availability";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Days & hours",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Your Services",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 340,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _servicesController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your services";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Services",
                      hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    createAccount(_nameController.text.trim(), _passwordController.text.trim());
                  }
                },
                child: Container(
                  height: 55,
                  width: 340,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 57, 102, 150),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 201, 201, 201),
                            offset: Offset(02, 03),
                            blurRadius: 0.5,
                            spreadRadius: 0.2),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DescriptionScr()),
                );
              },
              child: const Text("Do want us to edit your short description?",
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 7, 97, 139)),
                  textAlign: TextAlign.center),
            ),
          ]),
        ),
      ),
    );
  }
}
