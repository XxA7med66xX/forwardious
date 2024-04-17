import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.divisions,
    this.label,
    this.onChanged,
    this.onChangeEnd,
    required this.min,
    required this.max,
    required this.value,
    this.toolTip,
  });

  const CustomSlider.sub({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.divisions,
    this.label,
    this.onChanged,
    this.onChangeEnd,
    required this.min,
    required this.max,
    required this.value,
    this.toolTip,
  });

  final String title;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final int? divisions;
  final String? label;
  final String? toolTip;
  final double min;
  final double max;
  final double value;
  final Function(double)? onChanged;
  final Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Tooltip(
                message: toolTip,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: Slider(
                divisions: divisions,
                label: label,
                min: min,
                max: max,
                value: value,
                onChanged: onChanged,
                onChangeEnd: onChangeEnd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
