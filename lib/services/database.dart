import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
  //   return await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(id)
  //       .set(userInfoMap);
  //}

  Future addProductItem(Map<String, dynamic> userInfoMap, String name ) async {
    return await FirebaseFirestore.instance
        .collection(name).
    add(userInfoMap);
  }
  Future<Stream<QuerySnapshot>>getProductItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();

  }


}