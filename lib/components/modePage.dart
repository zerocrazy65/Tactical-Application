
import 'package:flutter/material.dart';

import '../screens/mode/mode1.dart';
import '../screens/mode/mode2.dart';
import '../screens/mode/mode3.dart';

class ModePage extends StatelessWidget {
  final String modeName;
  final int modeNum;

  const ModePage({Key? key, required this.modeName, required this.modeNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget modeWidget;
    switch (modeName) {
      case 'Shooting Practice Mode':
        modeWidget = Mode1(modeNum: modeNum);
        break;
      case 'Fast Shot Mode':
        modeWidget = Mode2(modeNum: modeNum);
        break;
      case 'Hostage Rescue Mode':
        modeWidget = Mode3(modeNum: modeNum);
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
