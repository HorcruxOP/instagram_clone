import 'package:firebase_auth/firebase_auth.dart';

 signIn(String email, password) async {
  try {
    
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "user";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      return('Wrong password provided for that user.');
    }
    
  } catch (e) {
    print('Error signing in: $e');
    
  }
}

signUp(String email, password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      return ('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
