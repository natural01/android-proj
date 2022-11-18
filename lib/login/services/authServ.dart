import 'package:data_bases_project/login/userWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;

class AuthSevrice {
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return UserWidget.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      user?.updateDisplayName(name);
      return UserWidget.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await fAuth.signOut();
  }

  Stream<UserWidget?> get currentUser {
    return fAuth.authStateChanges().map(
        (User? user) => user != null ? UserWidget.fromFirebase(user) : null);
  }
}
