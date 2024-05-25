// // ignore: file_names
// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class signIn extends StatefulWidget {
//   const signIn({super.key});

//   @override
//   State<signIn> createState() => _signInState();
// }

// // ignore: camel_case_types
// class _signInState extends State<signIn> {
//   var formkey = GlobalKey<FormState>();
//   var isvalid = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 146, 249, 254),
//           gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
//             Color.fromARGB(255, 146, 249, 254),
//             Color.fromARGB(255, 195, 243, 242),
//             Color.fromARGB(255, 214, 250, 255),
//             Color.fromARGB(255, 146, 249, 254),
//           ]),
//         ),
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "assets/images/threedoctors.png",
//                   height: 240,
//                   width: 260,
//                 ),
//                 const Text("Sign In",
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Color.fromARGB(255, 7, 97, 137),
//                     )),
//                 const SizedBox(height: 5),
//                 Form(
//                     key: formkey,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               // ignore: sort_child_properties_last
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value!.length < 6) {
//                                     return "enter your name";
//                                   }
//                                   return null;
//                                 },
//                                 decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'name',
//                                   hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 253, 252, 252)),
//                                   prefixIcon: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(255, 252, 253, 252),
//                                   ),
//                                 ),
//                                 keyboardType: TextInputType.emailAddress,
//                               ),
//                               height: 50,
//                               width: 320,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: const Color.fromARGB(255, 7, 97, 139), width: 1.0),
//                                   borderRadius: BorderRadius.circular(17),
//                                   color: const Color.fromARGB(255, 7, 97, 139),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                         color: Color.fromARGB(255, 201, 201, 201),
//                                         offset: Offset(03, 04),
//                                         blurRadius: 0.5,
//                                         spreadRadius: 0.2),
//                                   ]),
//                             ),
//                             SizedBox(
//                               height: 2,
//                               child: Container(
//                                 // ignore: sort_child_properties_last
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.emailAddress,
//                                   textAlign: TextAlign.justify,
//                                   obscureText: true,
//                                   decoration: const InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: 'Password',
//                                     hintStyle: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 255, 254, 254)),
//                                     prefixIcon: Icon(Icons.lock,
//                                         // color:Color.fromARGB(255, 12, 117, 15)),
//                                         color: Color.fromARGB(255, 255, 255, 255)),
//                                   ),
//                                 ),
//                                 height: 50,
//                                 width: 320,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: const Color.fromARGB(255, 51, 197, 226), width: 1.0),
//                                     borderRadius: BorderRadius.circular(17),
//                                     color: const Color.fromARGB(255, 51, 197, 226),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Color.fromARGB(255, 201, 201, 201),
//                                           offset: Offset(03, 04),
//                                           blurRadius: 0.5,
//                                           spreadRadius: 0.2),
//                                     ]),
//                               ),
//                             ),
//                           ]),
//                     )),
//                 //
//                 const SizedBox(height: 0),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Text(
//                     "Forgot password?",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 9, 97, 139),
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Container(
//                     // ignore: sort_child_properties_last
//                     height: 50,
//                     width: 320,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: const Color.fromARGB(255, 238, 237, 237), width: 1.0),
//                         borderRadius: BorderRadius.circular(17),
//                         color: const Color.fromARGB(255, 254, 255, 255),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Color.fromARGB(255, 201, 201, 201),
//                               offset: Offset(03, 04),
//                               blurRadius: 0.5,
//                               spreadRadius: 0.2),
//                         ]),
//                     child: const Text(
//                       "Sign In",
//                       style: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       if (formkey.currentState!.validate()) {}
//                     },
//                     child: Container(
//                       // ignore: sort_child_properties_last
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 7, 97, 139)),
//                         textAlign: TextAlign.center,
//                       ),

//                       // ignore: sort_child_properties_last

//                       height: 50,
//                       width: 320,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 1.0),
//                           borderRadius: BorderRadius.circular(17),
//                           color: const Color.fromARGB(255, 146, 249, 254),
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: Color.fromARGB(255, 201, 201, 201),
//                                 offset: Offset(03, 04),
//                                 blurRadius: 0.5,
//                                 spreadRadius: 0.2),
//                           ]),
//                     ),
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
