import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

createUserCredential(String email, password, docName) async {
  await FirebaseFirestore.instance.collection("Users").doc(docName).set({
    "user-credential": {
      "email": email,
      "password": password,
    }
  });
}

Future<bool> checkUsernameExists(String username) async {
  var docsName = await FirebaseFirestore.instance.collection("Users").get();
  for (var doc in docsName.docs) {
    if (doc.id == username) {
      return true;
    }
  }
  return false;
}

getUserName() async {
  var docsName = await FirebaseFirestore.instance.collection("Users").get();
  var email = FirebaseAuth.instance.currentUser!.email;
  for (var doc in docsName.docs) {
    if (doc["user-credential"]["email"] == email) {
      print(doc.id);
      return doc.id;
    }
  }
}
