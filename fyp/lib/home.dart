import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/searchResults.dart';
import 'package:fyp/signIn.dart';

import 'package:fyp/specialist.dart';

import 'bcont.dart';
import 'cont.dart';
import 'detail.dart';
import 'diseases.dart';
import 'mcont.dart';
import 'myappt.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Set<String> _symptoms = {
    "symptom 1",
    'symptom 2',
    "symptom 3",
    "symptom 4",
    "symptom 5",
    "symptom 6",
  };
  var iconList = [
    "assets/images/fever.png",
    "assets/images/heart.png",
    "assets/images/cancer.png",
    "assets/images/diarrhea.png",
    "assets/images/pregnant.png",
    "assets/images/hypertention.png",
  ];

  var textList = ["Fever", "Heart attack", "cancer", "Diarrhea", "Pregnancy", "Hypertention"];
  // ignore: non_constant_identifier_names
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
  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const logIn()));
  }

  var doctors = [];

  var currentUsername = '';

  late var getDocs;

  var searchFieldController = TextEditingController();

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

  fetchCurrentUser() async {
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      setState(() {
        currentUsername = value.data()!['name'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
    getDocs = fetchDoctorsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
      ),

      drawer: Drawer(
        // backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              accountName: Text(
                currentUsername,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              accountEmail: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("assets/images/applogo.png"),
                ),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const myAppSc(
                              isUser: true,
                            )));
              },
              leading: const Icon(
                Icons.all_inclusive,
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              title: const Text(
                "Your appointments",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            // const ListTile(
            //   leading: Icon(
            //     Icons.storage,
            //     color: Color.fromARGB(255, 57, 102, 150),
            //   ),
            //   title: Text(
            //     "Records",
            //     style: TextStyle(
            //       color: Color.fromARGB(255, 57, 102, 150),
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            // const ListTile(
            //   leading: Icon(
            //     Icons.notifications,
            //     color: Color.fromARGB(255, 57, 102, 150),
            //   ),
            //   title: Text(
            //     "Notifications",
            //     style: TextStyle(
            //       color: Color.fromARGB(255, 57, 102, 150),
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            const ListTile(
              leading: Icon(
                Icons.share,
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              title: Text(
                "Share",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.call,
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              title: Text(
                "Emergency call",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
              onTap: () {
                logOut();
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.info,
                color: Color.fromARGB(255, 57, 102, 150),
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 102, 150),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        color: const Color.fromARGB(255, 247, 249, 252),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 57, 102, 150),
              ),
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 57, 102, 150),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14, bottom: 6),
                        child: Image(
                          image: AssetImage("assets/images/greetinglady.png"),
                          height: 70,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12, left: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Howdy! ",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              " Let's find your Doctor :) ",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // search bar

                const SizedBox(height: 10),
                Container(
                  // ignore: sort_child_properties_last
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 7, 97, 137),
                            )),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchFieldController,
                          decoration: InputDecoration(
                            hintText: "Search Your doctor",
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                if (searchFieldController.text.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchResults(searchResult: searchFieldController.text)));
                                }
                              },
                              child: const Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 7, 97, 137),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  height: 45,
                  width: 340,

                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 228, 227, 227), width: 1.0),
                      borderRadius: BorderRadius.circular(17),
                      color: const Color.fromARGB(255, 254, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 201, 201, 201),
                            offset: Offset(02, 03),
                            blurRadius: 0.5,
                            spreadRadius: 0.2),
                      ]),
                ),
              ]),
            ),
            Expanded(
                // ignore: avoid_unnecessary_containers
                child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Symptoms",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 7, 97, 137),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => allDiseases()),
                                  );
                                },
                                child: const Text(
                                  "view all",
                                  style: TextStyle(color: Color.fromARGB(255, 7, 97, 137), fontSize: 12),
                                )),
                            // Text(
                            //   "view all",
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Color.fromARGB(255, 7, 97, 137),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _symptoms.length,
                          // ignore: non_constant_identifier_names
                          itemBuilder: (context, Index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const allSpecialist()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 23),
                                // ignore: avoid_unnecessary_containers
                                child: Column(
                                  children: [
                                    MyContainer(
                                      child: Image.asset(
                                        iconList[Index],
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(textList[Index],
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(255, 7, 97, 137),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 138,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const allSpecialist()),
                                );
                              },
                              child: MyBcontainer(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/FD2.png",
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          "Book Appointment",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                        // Text("Now",
                                        // style: TextStyle(fontSize: 12),),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const allSpecialist()),
                                );
                              },
                              child: MyBcontainer(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/MD2RYLE.png"),
                                      const Text("Consult Online",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Diseases",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 7, 97, 137),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => allDiseases()),
                                  );
                                },
                                child: const Text(
                                  "view all",
                                  style: TextStyle(color: Color.fromARGB(255, 7, 97, 137), fontSize: 12),
                                )),
                            // Text(
                            //   "view all",
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Color.fromARGB(255, 7, 97, 137),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _Diseases.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const allSpecialist()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                // ignore: avoid_unnecessary_containers
                                child: Column(
                                  children: [
                                    MyContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Image.asset(iconList2[index]),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      textList2[index],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color.fromARGB(255, 7, 97, 137),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Specialist",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 7, 97, 137),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const allSpecialist()),
                                  );
                                },
                                child: const Text(
                                  "view all",
                                  style: TextStyle(color: Color.fromARGB(255, 7, 97, 137), fontSize: 12),
                                )),
                            // Text(
                            //   "view all",
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Color.fromARGB(255, 7, 97, 137),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      child: FutureBuilder(
                        future: getDocs,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  var singleDoctorData = snapshot.data![index];
                                  log(singleDoctorData.toString());

                                  return Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    // ignore: avoid_unnecessary_containers
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailScr(
                                                        docId: singleDoctorData['id'],
                                                      )),
                                            );
                                          },
                                          child: MyMedContainer(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  imageList[index],
                                                ),
                                                Text(
                                                  singleDoctorData['name'],
                                                  // textList3[index],
                                                  style: const TextStyle(fontSize: 14, color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
