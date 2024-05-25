import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: child,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
          borderRadius: BorderRadius.circular(19),
          color: const Color.fromARGB(255, 57, 102, 150),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 201, 201, 201), offset: Offset(02, 03), blurRadius: 0.5, spreadRadius: 0.2),
          ]),
    );
  }
}
