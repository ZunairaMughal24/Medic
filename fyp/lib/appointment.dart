import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'myappt.dart';

class AppointmentView extends StatefulWidget {
  final String docId, name;

  const AppointmentView({super.key, required this.docId, required this.name});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  var isLoading = false;
  var appointmentDayController = TextEditingController();
  var appointmentDateController = TextEditingController();
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  makeAppointment() async {
    setState(() {
      isLoading = true;
    });
    var appointment = FirebaseFirestore.instance.collection('appointments').doc();
    await appointment.set({
      'appointment_day': appointmentDayController.text,
      'appointment_date': appointmentDateController.text,
      'appointment_by_name': nameController.text,
      'appointment_by_number': numberController.text,
      'appointment_by_id': FirebaseAuth.instance.currentUser!.uid,
      'appintment_with_id': widget.docId,
      'appointment_with_name': widget.name,
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "Select Appointment day",
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
                child: TextField(
                  controller: appointmentDayController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Select day",
                    hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "Select Appointment date",
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
                child: TextField(
                  controller: appointmentDateController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Select date",
                    hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "Full name",
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
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter name",
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
                child: TextField(
                  controller: numberController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter number",
                    hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 149, 160, 165)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await makeAppointment();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const myAppSc(isUser: true)),
                      );
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
                          "Make an Appointment",
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
        ]),
      ),
    );
  }
}
