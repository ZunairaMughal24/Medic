import 'package:flutter/material.dart';

class MyMedContainer extends StatelessWidget {
  const MyMedContainer({super.key, required this.child});
  // ignore: prefer_typing_uninitialized_variables
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: child,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
          borderRadius: BorderRadius.circular(19),
          //  color: Color.fromARGB(255, 222, 235, 244),
          color: const Color.fromARGB(255, 146, 249, 254),
          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color.fromARGB(255, 57, 102, 150),
            Color.fromARGB(255, 138, 174, 210),
            Color.fromARGB(255, 57, 102, 150),
          ]),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 201, 201, 201), offset: Offset(02, 03), blurRadius: 0.5, spreadRadius: 0.2),
          ]),
    );
  }
}
