import 'dart:math';
import 'package:flutter/material.dart';

class Quiz001 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomPaint(
          size: const Size(100, 100),
          painter: CirclePaint(),
        ),
      ),
    );
  }
}
class CirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('Size(${size.width},${size.height})');// Size(100,100)
    final paint = Paint()..color = Colors.red;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height);
    canvas.drawCircle(center, radius, paint);
  }

  // 再描画する必要なし
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

