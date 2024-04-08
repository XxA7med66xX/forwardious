import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {

  final Function()? onPressed;
  final Icon icon;
  final String tooltip;
  final BoxDecoration decoration;
  final Color decorationColor;
  final OutlinedBorder outlinedBorder;
  
  ///As it's name, this is just custom flat transparent button
  const CustomFlatButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.tooltip,
    this.decorationColor = Colors.transparent,
    this.outlinedBorder = LinearBorder.none,
  }) : decoration = const BoxDecoration();
        
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        tooltip: tooltip,
        splashRadius: 10,
        style: IconButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(10),
          shape: outlinedBorder,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
      ),
    );
  }

  

}