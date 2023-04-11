import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';
import '../database/scoreDb.dart';
import 'widget/loading.dart';

class scoreDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Score',
            style: FontTheme.headerText,
          ),
          centerTitle: true,
          backgroundColor: ColorTheme.whiteBgColor,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: DataService.fetchData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: loadingAnimation());
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Text('Error fetching data.');
                }
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
                              data['name'],
                              style: FontTheme.regularText,
                            ),
                            Text(
                              data['age'].toString(),
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
