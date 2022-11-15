import 'package:data_bases_project/login/lendingPage.dart';
import 'package:data_bases_project/login/userWidget.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/pages/testDataPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserWidget?>.value(
      value: AuthSevrice().currentUser,
      initialData: null,
      child: ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LandingPage(),
        ),
      ),
    );
  }
}
