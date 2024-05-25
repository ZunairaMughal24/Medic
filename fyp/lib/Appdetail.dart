import 'package:flutter/material.dart';

class AppDetail extends StatelessWidget {
  final dynamic data;

  const AppDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        title: Text(
          'Appointments with ${data['appointment_with_name']} ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 340,
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
                borderRadius: BorderRadius.circular(19),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 201, 201, 201),
                      offset: Offset(02, 03),
                      blurRadius: 0.5,
                      spreadRadius: 0.2),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Selected Appointment day",
                      style: TextStyle(
                        color: Color.fromARGB(255, 57, 102, 150),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    data['appointment_day'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 150, 155, 160),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Selected Appointment date",
                    style: TextStyle(
                      color: Color.fromARGB(255, 57, 102, 150),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    data['appointment_date'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 150, 155, 160),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Full name",
                    style: TextStyle(
                      color: Color.fromARGB(255, 57, 102, 150),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    data['appointment_by_name'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 150, 155, 160),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Contact number",
                    style: TextStyle(
                      color: Color.fromARGB(255, 57, 102, 150),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    data['appointment_by_number'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 150, 155, 160),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
