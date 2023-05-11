import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';
import '../database/auth.dart';
import '../database/scoreDb.dart';
import 'widget/loading.dart';

class ScoreDataList extends StatefulWidget {
  const ScoreDataList({Key? key}) : super(key: key);

  @override
  _ScoreDataListState createState() => _ScoreDataListState();
}

class _ScoreDataListState extends State<ScoreDataList> {
  String selectedButton = 'Time'; // initially set to 'Score'
  final User? user = Auth().currentUser;
  bool _isScoreActive = false; // initially Time button is active
  bool _isTimeActive = true; // initially Time button is active
  void _toggleButton(bool isTime) {
    setState(() {
      if (isTime) {
        _isScoreActive = true;
        _isTimeActive = false;
        selectedButton = 'Score';
      } else {
        _isScoreActive = false;
        _isTimeActive = true;
        selectedButton = 'Time';
      }
    });
  }

  String formatTime(int minutes) {
    int hours = (minutes / 60).floor();
    int min = minutes % 60;
    return '$hours : ${min < 10 ? '0' : ''}$min';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Leaderboard',
            style: FontTheme.headerText,
          ),
          centerTitle: true,
          backgroundColor: ColorTheme.whiteBgColor,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      _toggleButton(false),
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isTimeActive ? Colors.blue : Colors.grey,
                    ),
                    child: const Text(
                      'Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      _toggleButton(true),
                      selectedButton = 'Score',
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isScoreActive ? Colors.blue : Colors.grey,
                    ),
                    child: const Text(
                      'Score',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: DataService.fetchData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: loadingAnimation(),
                  );
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Text('Error fetching data.');
                }
                if (snapshot.data != null && snapshot.data!.isEmpty) {
                  return Column(children: const [
                    Text('Text'),
                  ]);
                }
                snapshot.data!.sort((a, b) {
                  if (selectedButton == 'Score') {
                    return b['Score'].compareTo(
                        a['Score']); // sort by score in descending order
                  } else {
                    return a['Time'].compareTo(
                        b['Time']); // sort by time in ascending order
                  }
                });
                return Column(
                  children: snapshot.data!.map((data) {
                    return ListTile(
                      title: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['Email'].toString(),
                              style: FontTheme.regularText,
                            ),
                            if (_isTimeActive)
                              Text(
                                formatTime(
                                  data['Time'],
                                ),
                                style: FontTheme.regularText,
                              ),
                            if (_isScoreActive)
                              Text(
                                data['Score'].toString(),
                                style: FontTheme.regularText,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ]),
        ),
      ],
    );
  }
}
