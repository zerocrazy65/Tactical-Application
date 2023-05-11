import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../components/widget/loading.dart';
import '../database/auth.dart';
import '../models/style.dart';
import 'package:firebase_core/firebase_core.dart';

class TrainingPage extends StatefulWidget {
  final int modeNum;

  const TrainingPage({Key? key, required this.modeNum}) : super(key: key);
  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  late final DatabaseReference _scoreRef;
  late Timer _timer;
  final User? user = Auth().currentUser;
  final player = AudioPlayer();

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _scoreRef = FirebaseDatabase.instance.ref().child('username');
  }

  void _updateScore(int newStatus) {
    _scoreRef.child('status').set(newStatus);
    _scoreRef.child('email').set(user?.email ?? 'user email');
  }

  void _showDialog(
      BuildContext context, int time, int score, int miss, int plus) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Column(
              children: [
                Center(
                    child:
                        Text('Time left : $time', textAlign: TextAlign.center)),
                Center(
                    child: Text('Score: $score', textAlign: TextAlign.center)),
              ],
            ),
            content:
                Text('Plus : $plus, Miss: $miss ', textAlign: TextAlign.center),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
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
            color: ColorTheme.bgGreenColor,
          ),
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
                  padding: const EdgeInsets.all(16.0),
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
                    ],
                  ),
                  child: StreamBuilder(
                    stream: _scoreRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: loadingAnimation(),
                        );
                      }
                      final data = snapshot.data?.snapshot.value;
                      if (data is Map<dynamic, dynamic>) {
                        var time = data['time'];
                        final plus = data['plus'];
                        final miss = data['miss'];
                        // Use the score, plus, and miss values as needed
                        var score = plus - miss;
                        if (score < 0) {
                          score = 0;
                        }
                        // Display the values in the UI
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 50),
                            Text(
                              'Score: ${score ?? 'none'}',
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              'Time left:',
                              style: TextStyle(
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timer,
                                  size: 28,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${time ?? 'none'}',
                                  style: const TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  's',
                                  style: TextStyle(
                                    fontSize: 28,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Plus: ${plus ?? 'none'}',
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Miss: ${miss ?? 'none'}',
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isRunning = !_isRunning;
                                  if (_isRunning) {
                                    _updateScore(widget.modeNum);
                                    const oneSec = Duration(seconds: 1);
                                    player.play(AssetSource("audio/beep.mp3"));
                                    _timer = Timer.periodic(
                                      oneSec,
                                      (Timer timer) {
                                        // Audio finished playing
                                        if (time == 0) {
                                          _isRunning = false;
                                          _showDialog(
                                              context, time, score, miss, plus);
                                          player.play(
                                              AssetSource("audio/beep.mp3"));
                                          _scoreRef.child('end').set(1);
                                          _updateScore(0);
                                          _timer.cancel();
                                        } else {
                                          time--;
                                          FirebaseDatabase.instance
                                              .ref()
                                              .child('username')
                                              .update({'time': time});
                                        }
                                      },
                                    );
                                  }
                                  if (!_isRunning) {
                                    _showDialog(
                                        context, time, score, miss, plus);
                                    player.play(AssetSource("audio/beep.mp3"));
                                    _scoreRef.child('end').set(1);
                                    _updateScore(0);
                                    _timer.cancel();
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
                        return const CircularProgressIndicator();
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
