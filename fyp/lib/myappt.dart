import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Appdetail.dart';
import 'package:fyp/signIn.dart';

// ignore: camel_case_types, must_be_immutable
class myAppSc extends StatefulWidget {
  final bool isUser;
  const myAppSc({super.key, required this.isUser});

  @override
  State<myAppSc> createState() => _myAppScState();
}

class _myAppScState extends State<myAppSc> {
  final Set<String> _appointments = {
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
  var appointments = [];
  late var getAppoints;

  fetchAppointmentsList() async {
    try {
      QuerySnapshot doctorsData = await FirebaseFirestore.instance.collection('appointments').get();
      for (var item in doctorsData.docs) {
        var data = item.data() as Map<String, dynamic>;
        data['id'] = item.id;
        appointments.add(data);
        if (widget.isUser) {
          appointments = appointments
              .where((element) => element['appointment_by_id'] == FirebaseAuth.instance.currentUser!.uid.toString())
              .toList();
        } else {
          appointments = appointments
              .where((element) => element['appointment_with_id'] == FirebaseAuth.instance.currentUser!.uid.toString())
              .toList();
        }
      }

      return appointments;
    } catch (e) {
      print('Error getting doctors: $e');
      return [];
    }
  }

  var currentUsername = '';

  fetchCurrentUser() async {
    FirebaseFirestore.instance.collection('doctors').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      setState(() {
        currentUsername = value.data()!['name'];
      });
    });
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const logIn()));
  }

  @override
  void initState() {
    super.initState();
    if (widget.isUser == false) {
      fetchCurrentUser();
    }
    getAppoints = fetchAppointmentsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.isUser
          ? null
          : Drawer(
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
                        child: Image.asset("assets/images/greetinglady.png"),
                      ),
                    ),
                  ),
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
      backgroundColor: const Color.fromARGB(255, 247, 249, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 102, 150),
        title: const Text(
          'My Appointments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getAppoints,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int Index) {
                  var singleAppointment = snapshot.data[Index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppDetail(
                                  data: singleAppointment,
                                )),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(255, 57, 102, 150),
                      child: Image.asset("assets/images/MD2RYLE.png"),
                    ),
                    title: Text(
                      singleAppointment['appointment_with_name'] ?? "",
                      // textList3[Index],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 7, 97, 137),
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      singleAppointment['appointment_day'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 144, 152, 160),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
