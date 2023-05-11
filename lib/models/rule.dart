import 'package:flutter/material.dart';
import 'package:tacticle_app/models/style.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> bullets;

  const ListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.bullets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FontTheme.headerText,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: FontTheme.regularText,
          ),
          const SizedBox(height: 8),
          if (bullets.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final bullet in bullets)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '•',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            bullet,
                            style: FontTheme.regularText,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
