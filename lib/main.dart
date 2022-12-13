import 'package:data_bases_project/login/userWidget.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/pages/SignIn.dart';
import 'package:data_bases_project/pages/dashboard.dart';
import 'package:data_bases_project/pages/homePage.dart';
import 'package:data_bases_project/pages/testDataPage.dart';
import 'package:data_bases_project/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/auth/bloc/auth_bloc.dart';

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
        child: RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
            child: MaterialApp(
              home: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                    if (snapshot.hasData) {
                      return const MyHomePage();
                    }
                    // Otherwise, they're not signed in. Show the sign in page.
                    return const SignIn();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
