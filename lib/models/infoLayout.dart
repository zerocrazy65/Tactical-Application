import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';

import '../screens/Info/infoContent.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final num? mode;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.mode,
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
              mode: mode,
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
                      child: Text(subtitle!, style: FontTheme.boldText),
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
