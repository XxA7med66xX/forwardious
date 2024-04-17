import 'package:flutter/material.dart';
import 'package:forwardious/frontend/modules/custom_flat_button.dart';
import 'package:forwardious/frontend/modules/section_title.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/always_loop.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/audio_mode.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/auto_play.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/default_captions/default_captions.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/instance_locale.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/play_next.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/thin_mode.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/video_quality.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/volume_slider.dart';
import 'package:forwardious/i18n/strings.g.dart';

class InvidiousPreferencesScreen extends StatelessWidget {
  const InvidiousPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbar(),
            SectionTitle(title: context.t.settingsScreen.Main),
            const AudioMode(),
            const VideoQuality(),
            const InstanceLocale(),
            const DefaultCaptions(),
            SectionTitle(title: context.t.settingsScreen.other),
            const AutoPlay(),
            const AlwaysLoop(),
            const PlayNext(),
            const ThinMode(),
            const VolumeSlider()
          ],
        ),
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
