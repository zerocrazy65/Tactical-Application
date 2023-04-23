import 'package:flutter/material.dart';

import '../screens/mode/mode1.dart';
import '../screens/mode/mode2.dart';
import '../screens/mode/mode3.dart';

class ModePage extends StatelessWidget {
  final int modeNumber;

  const ModePage({Key? key, required this.modeNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget modeWidget;
    switch (modeNumber) {
      case 1:
        modeWidget = const Mode1();
        break;
      case 2:
        modeWidget = const Mode2();
        break;
      case 3:
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
        title: Text('Mode $modeNumber'),
      ),
      body: modeWidget,
    );
  }
}
