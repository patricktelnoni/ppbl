import 'package:flutter/material.dart';

class CustomScalePainter extends CustomPainter{
  final Offset offset;
  final double scale;

  CustomScalePainter({required this.offset, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Save the current canvas state
    canvas.save();

    // Transform the canvas based on scale and offset
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);
    canvas.translate(-center.dx, -center.dy);
    canvas.translate(offset.dx, offset.dy);

    final radius = size.width / 4;
    canvas.drawRect(
      Rect.fromCenter(
        center: center,
        width: radius * 2,
        height: radius * 2,
      ),
      paint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class ScaleExample extends StatefulWidget {
  const ScaleExample({super.key});

  @override
  State<ScaleExample> createState() => _ScaleExampleState();
}

class _ScaleExampleState extends State<ScaleExample> {
  double _baseScale = 1.0;
  double _currentScale = 1.0;
  Offset _offset = Offset.zero;
  Offset? _lastFocalPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onScaleStart: (details) {
          _baseScale = _currentScale;
          _lastFocalPoint = details.localFocalPoint;
        },
        onScaleUpdate: (details) {
          setState(() {
            if (details.pointerCount > 1) {
              _currentScale = (_baseScale * details.scale);

              // Calculate the offset based on focal point movement
              if (_lastFocalPoint != null) {
                final delta = details.localFocalPoint - _lastFocalPoint!;
                _offset += delta / _currentScale;
                _lastFocalPoint = details.localFocalPoint;
              }
            }
          });
        },
        onScaleEnd: (details) {
          _lastFocalPoint = null;
        },
        child: CustomPaint(
          painter: CustomScalePainter(offset: _offset, scale: _currentScale),
          child: Container(), // Or any other child widget
        ),
      ),
    );
  }
}
