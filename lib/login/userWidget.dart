import 'package:firebase_auth/firebase_auth.dart';

class UserWidget {
  String? id;

  UserWidget.fromFirebase(User? user) {
    id = user!.uid;
  }
}
