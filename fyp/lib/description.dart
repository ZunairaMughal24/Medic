import 'package:flutter/material.dart';
import 'package:fyp/myappt.dart';

class DescriptionScr extends StatefulWidget {
  const DescriptionScr({super.key});

  @override
  State<DescriptionScr> createState() => _DescriptionScrState();
}

class _DescriptionScrState extends State<DescriptionScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        title: const Text(
          'Description',
          style: TextStyle(
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
              "Tell us about yourself, your work experience and speciality a bit in detail",
              style: TextStyle(
                color: Color.fromARGB(255, 57, 102, 150),
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 320,
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add here...",
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
                    "Submit",
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
