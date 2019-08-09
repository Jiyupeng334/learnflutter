import 'dart:convert';

/**
 * author:
 * time:2019/8/8
 * descript:
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'dart:math';
import 'dart:io';

import 'package:flutter/services.dart';

class MyPaint extends CustomPainter{
  
  BuildContext context;

  LoveType loveType;
  
  Paint mPaint;
  double screenWidth;
  double screenheight;
  
  double centerX;
  double centerY;

  double value;

  Path path;
  Rect rectLeft;
  Rect rectRight;

  MyPaint(BuildContext context,double value,LoveType loveType){
    this.context=context;
    this.value=value;
    this.loveType=loveType;
    initPaint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("mypaint-----paint+value=$value");
    switch(this.loveType){
      case LoveType.LoveLeft:
        path.addArc(rectLeft, 135*(pi/180), value*(pi/180));
        break;
      case LoveType.LoveRight:
        path.addArc(rectLeft, 135*(pi/180), 225*(pi/180));
        path.addArc(rectRight, 180*(pi/180), value*(pi/180));
        break;
      case LoveType.LineLeft:
        path.addArc(rectLeft, 135*(pi/180), 225*(pi/180));
        path.addArc(rectRight, 180*(pi/180), 225*(pi/180));
        path.lineTo(centerX+85*(1-value), centerY-15+95*value);
        break;
      case LoveType.LineRight:
        path.addArc(rectLeft, 135*(pi/180), 225*(pi/180));
        path.addArc(rectRight, 180*(pi/180), 225*(pi/180));
        path.lineTo(centerX, centerY+80);
        path.lineTo(centerX-85*value,centerY+80-95*value);
        break;
    };
//    path.addArc(rectRight, 180*(pi/180), value*(pi/180));
//    path.lineTo(centerX, centerY+80);
//    path.lineTo((centerX-50)-25*sqrt2,(centerY-50)+25*sqrt2);
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  void initPaint() {
    mPaint = new Paint();
    mPaint.color = Colors.red;
    mPaint.strokeWidth = 10;
    mPaint.style = PaintingStyle.stroke;
    mPaint.isAntiAlias = true;
    mPaint.strokeCap = StrokeCap.round;
    mPaint.blendMode = BlendMode.src; //颜色混合模式
    mPaint.maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0); //模糊遮罩效果
    mPaint.filterQuality = FilterQuality.high; //颜色渲染模式的质量
    mPaint.colorFilter =
        ColorFilter.mode(Colors.blueAccent, BlendMode.src); //颜色渲染模式
    
    screenWidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;
    
    centerX=screenWidth/2;
    centerY=screenheight/2;

    path=new Path();
    rectLeft=Rect.fromLTWH(centerX-100,centerY-100, 100, 100);
    rectRight=Rect.fromLTWH(centerX,centerY-100, 100, 100);
  }
}


enum LoveType{
  LoveLeft,
  LoveRight,
  LineLeft,
  LineRight
}
