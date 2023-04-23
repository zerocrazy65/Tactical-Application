import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/style.dart';
import 'package:firebase_core/firebase_core.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  late final DatabaseReference _scoreRef;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _scoreRef = FirebaseDatabase.instance.ref().child('username');
  }

  void _updateScore(bool newStatus) {
    _scoreRef.child('status').set(newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
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
                  child: StreamBuilder(
                    stream: _scoreRef.onValue,
                    builder: (context, snapshot) {
                      final data = snapshot.data?.snapshot.value
                          as Map<dynamic, dynamic>?;
                      if (data != null) {
                        final time = data['time'];
                        final plus = data['plus'];
                        final miss = data['miss'];
                        // Use the score, plus, and miss values as needed
                        var score = plus - miss;
                        if (score < 0) {
                          score = 0;
                        }
                        // Display the values in the UI
                        return Column(
                          children: [
                            const SizedBox(height: 50),
                            Text(
                              'Score: ${score ?? 'none'}',
                              style: const TextStyle(fontSize: 62),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              'Time: ${time ?? 'none'}',
                              style: const TextStyle(fontSize: 42),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Plus: ${plus ?? 'none'}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Miss: ${miss ?? 'none'}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isRunning = !_isRunning;
                                  if (_isRunning) {
                                    _updateScore(true);
                                  }
                                  if (!_isRunning) {
                                    _scoreRef.child('end').set(1);
                                    _updateScore(false);
                                  }
                                });
                              },
                              child: Text(_isRunning ? 'Stop' : 'Start'),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
