import 'package:flutter/material.dart';

import '../screens/mode/mode1.dart';
import '../screens/mode/mode2.dart';
import '../screens/mode/mode3.dart';

class ModePage extends StatelessWidget {
  final String modeName;

  ModePage({Key? key, required this.modeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget modeWidget;
    switch (modeName) {
      case 'Shooting Practice Mode':
        modeWidget = const Mode1();
        break;
      case 'Fast Shot Mode':
        modeWidget = const Mode2();
        break;
      case 'Hostage Rescue Mode':
        modeWidget = const Mode3();
        break;
      default:
        modeWidget = const Placeholder();
        break;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(modeName),
      ),
      body: modeWidget,
    );
  }
}
