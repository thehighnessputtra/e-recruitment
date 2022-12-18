import 'package:flutter/material.dart';

@override
navPushTransition(BuildContext context, Widget page) {
  Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(2.0, 0.0), end: Offset.zero),
            ),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
      ));
}

navReplaceTransition(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(2.0, 0.0), end: Offset.zero),
            ),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
      ));
}

navBackTransition(BuildContext context) {
  Navigator.pop(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
            ),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        },
      ));
}
