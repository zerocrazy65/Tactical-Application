import 'package:flutter/material.dart';

import '../../models/style.dart';

class InfoContentPage extends StatelessWidget {
  final String? subtitle;

  const InfoContentPage({Key? key, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(subtitle!),
      ),
      body: Stack(children: [
        Container(
            height: 250,
            width: double.infinity,
            color: ColorTheme.bgGreenColor),
        Opacity(
          opacity: 0.05,
          child: Container(
            height: 1000,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/bgApp1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Center(child: Text(subtitle!))
      ]),
    );
  }
}
