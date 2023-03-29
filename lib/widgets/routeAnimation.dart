import 'package:flutter/material.dart';

class MyRoute1 extends PageRouteBuilder{
  final Widget widget;
  MyRoute1(this.widget):super(
    transitionDuration: const Duration(seconds:3),
    pageBuilder: (BuildContext context, Animation<double> animation,
    Animation<double>secondaryAnimation ){
      return widget;
    },
    transitionsBuilder:(BuildContext context, Animation<double> animation,
    Animation<double>secondaryAnimation, Widget child ) {
      return SlideTransition(
        position: Tween(
            begin: Offset(1.0, 0.0),
            end: Offset(0.0, 0.0),
        )
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),

        child: child,
      );
    }
  );

}


class MyRoute2 extends PageRouteBuilder{
  final Widget widget;
  MyRoute2(this.widget):super(
      transitionDuration: const Duration(seconds:3),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double>secondaryAnimation ){
        return widget;
      },
      transitionsBuilder:(BuildContext context, Animation<double> animation,
          Animation<double>secondaryAnimation, Widget child ) {
        return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
          child: child,
        );
      }
  );

}