import 'package:flutter/material.dart';
import 'package:forwardious/frontend/modules/custom_flat_button.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/audio_mode.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/instance_locale.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/video_quality.dart';
import 'package:forwardious/i18n/strings.g.dart';

class InvidiousPreferencesScreen extends StatelessWidget {
  const InvidiousPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppbar(),
          AudioMode(),
          VideoQuality(),
          InstanceLocale()
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomFlatButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          tooltip: context.t.settingsScreen.back,
        ),
        const SizedBox(width: 10),
        Text(
          context.t.settingsScreen.invidiousPreferences.invidiousPreferences,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
