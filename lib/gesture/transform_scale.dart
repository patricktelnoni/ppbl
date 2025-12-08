import 'package:flutter/material.dart';

class AnimatedScaleExample extends StatefulWidget {
  const AnimatedScaleExample({super.key});

  @override
  State<AnimatedScaleExample> createState() => _AnimatedScaleExampleState();
}

class _AnimatedScaleExampleState extends State<AnimatedScaleExample> {
  double _scale = 1.0;

  void _toggleScale() {
    setState(() {
      _scale = _scale == 1.0 ? 1.5 : 1.0; // Toggles between original and 1.5x scale
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedScale Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: _toggleScale,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Animated',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleScale,
              child: const Text('Toggle Scale'),
            ),
          ],
        ),
      ),
    );
  }
}