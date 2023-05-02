import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';
import 'package:tacticle_app/screens/Info/infoContent.dart';

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
              title: 'assets/img/persona5.jpg',
              subtitle: 'พื้นฐานการใช้อาวุธปืน'),
          InfoCard(
              title: 'assets/img/persona5.jpg',
              subtitle: 'กฏความปลอดภัยของการใช้อาวุธปืน'),
          InfoCard(
              title: 'assets/img/persona5.jpg',
              subtitle: 'กติกาการแข่งขัน/ฝึกซ้อมยิงปืนพื้นฐาน'),
          InfoCard(title: 'assets/img/persona5.jpg', subtitle: 'C.A.R. System'),
          InfoCard(
              title: 'assets/img/persona5.jpg',
              subtitle: 'ชนิดและประเภทของปืนสั้น'),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoContentPage(
              subtitle: subtitle,
            ),
          ),
        );
      },
      child: Card(
        color: ColorTheme.whiteBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(microseconds: 200),
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.transparent),
                child: const Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    title!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle!,
                        style: const TextStyle(
                            fontSize: 16.0, color: FontTheme.primaryColor),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
