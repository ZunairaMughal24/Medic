// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bcont.dart';
import 'detail.dart';

// ignore: camel_case_types, must_be_immutable
class allSpecialist extends StatefulWidget {
  const allSpecialist({super.key});

  @override
  State<allSpecialist> createState() => _allSpecialistState();
}

class _allSpecialistState extends State<allSpecialist> {
  final Set<String> _specialist = {
    "specialist 1",
    'specialist 2',
    "specialist 3",
    "specialist 4",
    "specialist 5",
    "specialist 6",
  };

  var imageList = [
    "assets/images/MD2RYLE.png",
    "assets/images/FD3.png", //sofia
    "assets/images/FD5.png", //lilly
    "assets/images/FD5.png", //caty
    "assets/images/MD3.png", //altas
    "assets/images/MD1.png", //micheal
  ];

  var textList3 = ["Dr. Ryle", "Dr. Sofia", "Dr. Lilly", "Dr. Caty", "Dr. Altas", "Dr. Michal"];

  // ignore: unused_field
  var doctors = [];

  late var getDocs;

  fetchDoctorsList() async {
    try {
      QuerySnapshot doctorsData = await FirebaseFirestore.instance.collection('doctors').get();
      for (var item in doctorsData.docs) {
        var data = item.data() as Map<String, dynamic>;
        data['id'] = item.id;
        doctors.add(data);
      }
      return doctors;
    } catch (e) {
      print('Error getting doctors: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getDocs = fetchDoctorsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 102, 150),
          title: const Text(
            "All Specialist",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        body: FutureBuilder(
            future: getDocs,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 175, mainAxisSpacing: 8, crossAxisSpacing: 8),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScr(
                                        docId: snapshot.data[index]['id'],
                                      )),
                            );
                          },
                          child: MyBcontainer(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Image.asset("assets/images/MD2RYLE.png"),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    snapshot.data[index]['name'],
                                    // textList3[Index],
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
                );
              }
            }));
  }
}
