import 'package:flutter/material.dart';

class Tranaction {
  final RoutePageBuilder pageBuilder;
  
  //This is a simple transaction module
  //that represents the slide transaction.
  Tranaction({required this.pageBuilder});

  PageRouteBuilder<dynamic> slideTransaction(TextDirection direction) {
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          textDirection: direction,
          position: Tween(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
              reverseCurve: Curves.linear,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
