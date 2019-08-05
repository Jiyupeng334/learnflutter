/**
 * author:yupeng
 * descript:这是个画板的工具类
 */
import 'package:flutter/material.dart';
import 'dart:ui';

class Paper extends CustomPainter {
  Paint _paint;
  final List<List<TolyCircle>> lines;

  Paper({@required this.lines}) {
    _paint = Paint();
    _paint.style = PaintingStyle.stroke;
    _paint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for(int i=0;i<lines.length;i++){
      drawLine(canvas,lines[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  void drawLine(Canvas canvas, List<TolyCircle> positions) {
    for(int i=0;i<positions.length-1;i++){
      if(positions[i]!=null&&positions[i+1]!=null){
        canvas.drawLine(positions[i].pos, positions[i+1].pos, _paint..strokeWidth=positions[i].radius);
      }
    }
  }
}

class TolyDrawable {
  Color color;
  Offset pos;
  TolyDrawable(this.color, this.pos);
}

class TolyCircle extends TolyDrawable {
  double radius;
  TolyCircle(Color color, Offset pos, {this.radius = 1}) : super(color, pos);
}
