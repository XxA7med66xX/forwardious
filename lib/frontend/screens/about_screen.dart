import 'package:flutter/material.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/i18n/strings.g.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionCard(
      title: Text(context.t.About),
      trailing: const Icon(Icons.info),
      isButton: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AboutDialog();
          },
        );
      },
    );
  }
}

class AboutDialog extends StatelessWidget {
  const AboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset(
              'web/icons/icon-128.png',
              width: 128,
              height: 128,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Forwardious',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text('1.0.0', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '© 2024 Ahmed Al-HY ${context.t.Copyright}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(elevation: 0),
              child: Text(context.t.Close),
            ),
          ),
        ],
      ),
    );
  }
}
