import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_login/model/user_model.dart';


class UserDetails {
  addDetailsOfUser(UserModel model) async {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('user_details');
    await ref.doc(model.mobile).set(model.toJson());
  }

  Future<DocumentSnapshot> fetchDetailsOfUser(String userId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user_details')
        .doc(userId)
        .get();

    return documentSnapshot;
  }

  Future<bool> isUserIdExists(String userId) async {
  try {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('user_details') 
        .doc(userId)
        .get();
    return docSnapshot.exists;
  }on FirebaseException catch (e) {
    // Handle any potential exceptions here (e.g., FirebaseException)
    print('Error while checking user ID existence: $e');
    return false; // Return false if an error occurs
  }
}

}
