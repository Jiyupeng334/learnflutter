/**
 * author:
 * time:2019/8/8
 * descript:自定义布局layout
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui; //这里用as取个别名，有库名冲突


class CustomLayout extends SingleChildRenderObjectWidget {

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return new RenderCircle();
  }

}

class RenderCircle extends RenderBox{

  Paint _paint;
  Path _path;
  ui.Paragraph paragraph;

  RenderCircle(){
    _paint = Paint();
    _paint.isAntiAlias = true;
    _paint.style = PaintingStyle.fill;
    _path = Path();
    ui.ParagraphBuilder paragraphBuilder=ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: 14,
        textDirection: TextDirection.ltr,
        maxLines: 1
      )
    );
    paragraphBuilder.pushStyle(ui.TextStyle(
        color: Colors.black87, textBaseline: ui.TextBaseline.alphabetic),);
    paragraphBuilder.addText("custom layout");

    paragraph=paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: 50));
  }

    @override
  void performLayout() {
    // TODO: implement performLayout
    size=constraints.biggest;//满足父节点的最大尺寸，相当于match——parent
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var canvas=context.canvas;
    //画布移动到中心点
    canvas.translate(size.width/2, size.height/2);
//    //绘制表格
//    double width=150;
//    double j=-width;
//    for(double i = -width; i<= width; i+=10){
//      _paint.strokeWidth = 1;
//      _paint.color = Colors.grey;
//      canvas.drawLine(Offset(width, i), Offset(-width, i), _paint);
//      canvas.drawLine(Offset(i, -width), Offset(i, width), _paint);
//    }
//    //绘制坐标
//    _paint.strokeWidth = 2;
//    _paint.color = Colors.black;
//    canvas.drawLine(Offset(width, 0), Offset(-width, 0), _paint);
//    canvas.drawLine(Offset(0, -width), Offset(0, width), _paint);
//绘制外圈
    _paint.strokeWidth = 1.5;
    _paint.color = Colors.blueAccent;
    _paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(0, 0), 100, _paint);
    canvas.drawCircle(Offset(0, 0), 120, _paint);

    //绘制六芒星
    _paint.color = Colors.redAccent;
    _path.moveTo(0, -100);
    _path.lineTo(0.85*100, 0.5*100);
    _path.lineTo(-0.85*100, 0.5*100);
    _path.lineTo(0, -100);
    _path.moveTo(0, 100);
    _path.lineTo(0.85*100, -0.5*100);
    _path.lineTo(-0.85*100, -0.5*100);
    _path.lineTo(0, 100);
    canvas.drawPath(_path, _paint);
    canvas.drawParagraph(paragraph, Offset(0,0));
  }



}


