import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height * 0.4);
    path.cubicTo(size.width * 0.2, size.height * 0.1, -size.width * 0.25,
        size.height * 0.6, size.width / 2, size.height);
    path.moveTo(size.width / 2, size.height * 0.4);
    path.cubicTo(size.width * 0.8, size.height * 0.1, size.width * 1.25,
        size.height * 0.6, size.width / 2, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class MyPainter extends CustomPainter {
  // The color of the heart
  // final Color bodyColor;

  // The color of the border of the heart
  final Color borderColor;
  // The thickness of the border
  final double borderWith;

  MyPainter(this.borderColor, this.borderWith);

  @override
  void paint(Canvas canvas, Size size) {
    // The body of the heart
    // final Paint body = Paint();
    // body
    //   ..color = bodyColor
    //   ..style = PaintingStyle.fill
    //   ..strokeWidth = 0;

    // The border of the heart
    final Paint border = Paint();
    border
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderWith;

    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    // canvas.drawPath(path, body);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
