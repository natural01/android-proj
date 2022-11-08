import 'package:data_bases_project/login/auth.dart';
import 'package:data_bases_project/login/userWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserWidget? user = Provider.of<UserWidget?>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? MyHomePage() : AuthorizationWidget();
  }
}
