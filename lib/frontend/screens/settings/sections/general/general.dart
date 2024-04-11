import 'package:flutter/material.dart';
import 'package:forwardious/frontend/modules/section_title.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences_option.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/tab_refresh_option.dart';
import 'package:forwardious/i18n/strings.g.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SectionTitle(title: context.t.settingsScreen.general),
        
        const TabRefreshOption(),
        
        const InvidiousPrefrencesOption()
      ],
    );
  }
}
