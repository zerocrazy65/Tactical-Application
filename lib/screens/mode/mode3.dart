import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tacticle_app/screens/traningPage.dart';

import '../../models/style.dart';

class Mode3 extends StatefulWidget {
  final int modeNum;
  const Mode3({Key? key, required this.modeNum}) : super(key: key);

  @override
  State<Mode3> createState() => _Mode3State();
}

class _Mode3State extends State<Mode3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: ColorTheme.whiteBgColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorTheme.greyOpaColor,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Column(
                        children: const [
                          Center(
                            child: Text('Rule'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrainingPage(modeNum: widget.modeNum)));
                  },
                  child: Text('Next')),
            ],
          ),
        ),
      ],
    );
  }
}
