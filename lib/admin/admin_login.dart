// import 'package:coolthrow_client/admin/home_admin.dart';
// import 'package:coolthrow_client/widget/widget_support.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AdminLogin extends StatefulWidget {
//   const AdminLogin({super.key});
//
//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }
//
//
// final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
// class _AdminLoginState extends State<AdminLogin> {
//   TextEditingController usernameController = new TextEditingController();
//   TextEditingController userpasswordController = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xffededeb),
//     body: Container(
//     child: Stack(
//     children: [
//     Container(
//     height: MediaQuery.of(context).size.height,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.only(
//     top: MediaQuery.of(context).size.height / 2,
//     ),
//     padding: EdgeInsets.only(top: 45, right: 20, left: 20),
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     colors: [Color.fromARGB(255, 53, 60, 60), Colors.black],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     ),
//     borderRadius: BorderRadius.vertical(
//     top: Radius.elliptical(
//     MediaQuery.of(context).size.width, 110))),
//     ),
//     SingleChildScrollView(
//     child: Container(
//     margin: EdgeInsets.only(left: 30, right: 30, top: 50),
//     child: Form(
//     key: _formkey,
//     child: Column(
//     children: [
//     Text("Let's Start with\nAdmin!",
//     style:AppWidget.headlineTextFieldStyle()
//     //   TextStyle(
//     //       color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30),
//     // ),
//     ),
//     SizedBox(
//     height: 30,
//     ),
//     Material(
//     elevation: 3,
//     borderRadius: BorderRadius.circular(20),
//     child: Container(
//     height: MediaQuery.of(context).size.height / 2,
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(20),
//     ),
//     child: Column(
//     children: [
//     SizedBox(height: 50),
//     Container(
//     margin: EdgeInsets.only(left: 10, right: 10),
//     padding: EdgeInsets.only(left: 10, right: 10),
//     decoration: BoxDecoration(
//     color: Colors.black12,
//       borderRadius: BorderRadius.circular(10),
//     ),
//       child: TextFormField(
//         controller: usernameController,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return "Please Enter Username";
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "UserName"),
//       ),
//     ),
//       SizedBox(
//         height: 20,
//       ),
//       Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         padding: EdgeInsets.only(left: 10, right: 10),
//         decoration: BoxDecoration(
//             color: Colors.black12,
//             // color: Color.fromARGB(255,160,160,147),
//             borderRadius: BorderRadius.circular(10)
//         ),
//       child: TextFormField(
//         controller: userpasswordController,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return "Please Enter password";
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Password"),
//       ),
//     ),
//         SizedBox(
//           height: 40,
//         ),
//         GestureDetector(
//           onTap: () {
//             LoginAdmin();
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 12),
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(15)),
//             child: Center(
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold
//                   ),
//                 )),
//           ),
//         )
//     ],
//     ),
//     ),
//     )
//     ],
//     ),
//     ),
//     ),
//     )
//     ],
//     ),
//     ),
//     );
//   }
//   LoginAdmin() {
//     FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
//       snapshot.docs.forEach((result) {
//         if (result.data()['id'] != usernameController.text.trim()) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 "Your id is not correct ",
//                 style: TextStyle(color: Colors.red, fontSize: 18),
//               )));
//         } else if(
//         result.data()['id'] != usernameController.text.trim()) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 "Your password is not correct",
//                 style: TextStyle(color: Colors.red, fontSize: 18),
//               )));
//         }else{
//           Route route =MaterialPageRoute(builder: (context)=>HomeAdmin());
//           Navigator.pushReplacement(context, route);
//         }
//       },
//       );
//     });
//   }
// }


import 'package:coolthrow_client/admin/home_admin.dart';
import 'package:coolthrow_client/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Ensure this import is included
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  // Initialize Firebase in initState
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(); // Ensure Firebase is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2,
              ),
              padding: const EdgeInsets.only(top: 45, right: 20, left: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 53, 60, 60),
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    110,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text(
                        "Let's Start with\nAdmin!",
                        style: AppWidget.headlineTextFieldStyle(),
                      ),
                      const SizedBox(height: 30),
                      Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
                              Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Username";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "UserName",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: userpasswordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Password";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              GestureDetector(
                                onTap: () {
                                  LoginAdmin();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void LoginAdmin() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection("Admin").get();
      for (var result in snapshot.docs) {
        if (result.data()['id'] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Your id is not correct",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          );
        } else if (result.data()['password'] != userpasswordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Your password is not correct",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          );
        } else {
          Route route = MaterialPageRoute(builder: (context) => const HomeAdmin());
          Navigator.pushReplacement(context, route);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An error occurred: $e",
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }
  }
}

