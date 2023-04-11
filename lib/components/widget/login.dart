import 'package:flutter/material.dart';
import 'package:tacticle_app/screens/login_register.dart';

import '../../database/auth.dart';
import '../nav.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNavBar();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
