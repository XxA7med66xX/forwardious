import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  ///Section title is a simple text widget that
  ///shows the title of any option in settings.
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
