import 'package:flutter/material.dart';
import 'dart:math';

class CustomGestureButton extends StatefulWidget {
  const CustomGestureButton({super.key});

  @override
  State<CustomGestureButton> createState() => _CustomGestureButtonState();
}

class _CustomGestureButtonState extends State<CustomGestureButton> {
  Offset _panUpdatePosition = Offset.zero;
  bool _isPressed = false;

  double translateDistance(double distance, double limit) {
    return limit * sin(distance.clamp(-limit, limit) / limit);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (details) {
              setState(() {
                _isPressed = true;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                _panUpdatePosition = _panUpdatePosition - details.delta;
              });
            },
            onPanEnd: (details) {
              setState(() {
                _panUpdatePosition = Offset.zero;
                _isPressed = false;
              });
            },
            onPanCancel: () {
              setState(() {
                _panUpdatePosition = Offset.zero;
                _isPressed = false;
              });
            },
            child: ElevatedButton(
                onPressed: (){}, 
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Transform.scale(
                    scale: 1 - min(400, _panUpdatePosition.distance) / 1500,
                    child: Transform.translate(
                      offset: Offset(
                        translateDistance(_panUpdatePosition.dx / 10, 40),
                        translateDistance(_panUpdatePosition.dy / 10, 20),
                      ),
                      child: Image.network('https://picsum.photos/250?image=9'),

                    ),
                  ),
                )
            )
        )
    );
  }
}
