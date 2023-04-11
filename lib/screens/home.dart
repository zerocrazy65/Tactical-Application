import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../database/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
      child: const Text('Sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _userUid(),
        _signOutButton(),
      ],
    );
  }
}
