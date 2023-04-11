import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tacticle_app/components/widget/login.dart';
import 'package:tacticle_app/models/style.dart';

void main() async {
  // Initialize Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
    );
  }
}
