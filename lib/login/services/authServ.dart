import 'package:data_bases_project/login/userWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSevrice {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return UserWidget.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return UserWidget.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<UserWidget?> get currentUser {
    return _fAuth.authStateChanges().map(
        (User? user) => user != null ? UserWidget.fromFirebase(user) : null);
  }
}
