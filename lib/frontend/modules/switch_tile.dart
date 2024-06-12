import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {

  const SwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  });
  
  ///The [SwitchTile.sub] is the same as [SwitchTile]
  ///but with a different margin, representing that
  ///this option is subordinate to the main option.
  const SwitchTile.sub({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.margin = const EdgeInsets.only(bottom: 20,left: 20,right: 20),
  });

  final String title;
  final String? subtitle;
  final bool value;
  final Function(bool)? onChanged;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SwitchListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        value: value,
        onChanged: onChanged,
        hoverColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.grey.withOpacity(0.1),
      ),
    );
  }
}
