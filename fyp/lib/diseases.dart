// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fyp/specialist.dart';

import 'bcont.dart';

// ignore: camel_case_types, must_be_immutable
class allDiseases extends StatelessWidget {
  allDiseases({super.key});
  // ignore: unused_field
  final Set<String> _Diseases = {
    "Disease 1",
    'Disease 2',
    "Disease 3",
    "Disease 4",
    "Disease 5",
    "Disease 6",
  };
  var iconList2 = [
    "assets/images/typhoid.png",
    "assets/images/dengue.png",
    "assets/images/stomach.png",
    "assets/images/kidneys.png",
    "assets/images/piles.png",
    "assets/images/lungs.png",
  ];

  var textList2 = ["Typhoid fever", "dengue fever", "Gastritis", "Kidney stone", "Piles", "Lungs cancer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 102, 150),
          title: const Text(
            "All Diseases",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 175, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemCount: _Diseases.length,
              itemBuilder: (BuildContext context, int Index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const allSpecialist()));
                  },
                  child: MyBcontainer(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Image.asset(iconList2[Index]),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            textList2[Index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 254, 255, 255),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                );
              }),
        ));
  }
}
