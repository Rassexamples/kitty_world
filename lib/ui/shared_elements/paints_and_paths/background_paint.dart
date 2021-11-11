import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  Color mainColor;
  Offset newOffset;

  BackgroundPainter({required this.newOffset, required this.mainColor});

  @override
  void paint(Canvas canvas, Size size) {
    Path path1 = Path();
    Path path2 = Path();
    Paint paint = Paint();
    paint.color = mainColor;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;

    curve1(path1, size);
    curve2(path1, size);
    curve3(path1, size);
    curve4(path2, size);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void curve1(Path path, Size size) {
    path.moveTo(size.width, (size.height * .1));
    Offset c1 = Offset((size.width * .5), (size.height * .25) + newOffset.dy);
    Offset c2 = Offset(0, (size.height * .1));
    path.cubicTo(c1.dx, c1.dy, newOffset.dx, newOffset.dy * 2, c2.dx, c2.dy);
  }

  void curve2(Path path, Size size) {
    path.moveTo(0, size.height);
    Offset c1 = Offset(size.width, size.height * 2);
    Offset c2 = Offset(size.width * 2, size.height);
    path.cubicTo(c1.dx, c1.dy, newOffset.dx, newOffset.dy, c2.dx, c2.dy);
  }

  void curve3(Path path, Size size) {
    path.moveTo(0, size.height * .6);
    path.cubicTo(
        size.width,
        size.height * .9,
        size.width * .3,
        size.height / newOffset.dy,
        size.width + newOffset.dx,
        size.height * .3 + newOffset.dx);
  }

  void curve4(Path path, Size size) {
    path.moveTo(size.width, size.width);
    Offset c1 = Offset(size.width * .5, (size.height * .3) + newOffset.dy);
    Offset c2 = Offset(size.width * .8, newOffset.dy);
    path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, 0, size.height * .25);
  }
}
