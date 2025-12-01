import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {

  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;

  CustomContainer(
      {
        required this.child,
        this.height,
        this.width,
        this.color
      });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: child,
      ),
    );
  }
}