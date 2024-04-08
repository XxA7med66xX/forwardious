//This will be the background of any option
//ex: setting options

import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {

  ///Option card is a card that represents
  ///the content of an option with
  ///the overall app theme.
  const OptionCard({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  });

  ///The [OptionCard.sub] is the same as [OptionCard]
  ///but with a different margin, representing that
  ///this option is subordinate to the main option.
  const OptionCard.sub({
    super.key, 
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.margin = const EdgeInsets.only(bottom: 20,left: 20,right: 20),
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? margin;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}
