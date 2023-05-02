import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../database/auth.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final User? user = Auth().currentUser;

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Future<void> signOut() async {
    await Auth().signOut();
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _userUid(),
          _signOutButton(),
        ],
      ),
    );
  }
}
