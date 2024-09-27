import "package:firebase_auth/firebase_auth.dart";

signup(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("////////////////Success///////////////");
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password" || e.code == "email-already-in-use") {
      print("Check Creds");
    }
  } catch (e) {
    print(e);
  }
}

signin(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("////////////////Success///////////////");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
