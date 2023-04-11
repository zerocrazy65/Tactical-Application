import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';
import '../components/scoreData.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
            child: scoreDataList(),
          ),
        ],
      ),
    );
  }
}
