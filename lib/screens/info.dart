import 'package:flutter/material.dart';

import '../models/infoLayout.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 20.30,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          InfoCard(
            title: "assets/img/basicUsing.jpg",
            subtitle: 'พื้นฐานการใช้อาวุธปืน',
            mode: 1,
          ),
          InfoCard(
            title: "assets/img/gunSafety.jpg",
            subtitle: 'กฏความปลอดภัยของการใช้อาวุธปืน',
            mode: 2,
          ),
          InfoCard(
            title: "assets/img/firearmRule.jpg",
            subtitle: 'กติกาการแข่งขัน/ฝึกซ้อมยิงปืนพื้นฐาน',
            mode: 3,
          ),
          InfoCard(
            title: "assets/img/carSystem.jpg",
            subtitle: 'C.A.R. System',
            mode: 4,
          ),
          InfoCard(
            title: "assets/img/gunType.jpg",
            subtitle: 'ชนิดและประเภทของปืนสั้น',
            mode: 5,
          ),
        ],
      ),
    );
  }
}
