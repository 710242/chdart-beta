import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlowchdartBeta {

  static const MethodChannel _channel = const MethodChannel('flowchdart_beta');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class Start_end extends CustomPainter {

  double _center_x = 0.0;
  double _center_y = 0.0;
  double radius = 0.0;
  String text;

  bool is_end = false;

  TextStyle textStyle;

  Start_end(
      this._center_x,
      this._center_y,
      this.radius,
      this.text,
      this.textStyle,
      );

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black;

    // text setting
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: _center_x,
    );

    double width = text.length*10 as double < 100 ? 100 : text.length*10 as double;

    // center: Offset(_center_x, _center_y), radius: radius
    Rect rect = Rect.fromCenter(width : width, height: radius, center: Offset(_center_x,_center_y));
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(30));
    canvas.drawRRect(rRect, paint);
    // this should be in the center
    textPainter.paint(canvas, Offset(_center_x-text.length*4.5, _center_y-textStyle.fontSize!/2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class Condition extends CustomPainter {

  double _top_x = 0.0;
  double _top_y = 0.0;
  String text;
  num height;
  TextStyle textStyle;

  Condition(
      this._top_x,
      this._top_y,
      this.text,
      this.height,
      this.textStyle
      );


  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black;

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 1000,
    );

    double width;
    text.length*10 as double < 50 ? width = 100 : width = text.length*10 as double;

    Path path = Path();
    path.moveTo(_top_x, _top_y);
    path.lineTo(_top_x-(width), _top_y+height);
    // paint.color = Colors.transparent;
    // canvas.drawPath(path, paint);
    // paint.color = Colors.black;
    path.moveTo(_top_x-(width), _top_y+height);
    path.lineTo(_top_x, _top_y+2*height);
    path.lineTo(_top_x+(width), _top_y+height);
    path.lineTo(_top_x, _top_y);
    canvas.drawPath(path, paint);
    textPainter.paint(canvas, Offset(_top_x-text.length*5, _top_y+height-textStyle.fontSize!/2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Operation extends CustomPainter {

  double _top_x = 0.0;
  double _top_y = 0.0;
  String text;
  TextStyle textStyle;

  Operation(
      this._top_x,
      this._top_y,
      this.text,
      this.textStyle,
      );

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black;

    // text setting
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 1000,
    );

    double width = 50;
    // text.length*10 as double < 50 ? width = 100 : width = text.length*10 as double;

    // we'll use center x y to modify position
    Path path = Path();
    path.moveTo(_top_x, _top_y);
    path.lineTo(_top_x-(0.8*width)-(text.length*5 as double), _top_y);
    path.lineTo(_top_x-(1.2*width)-(text.length*5 as double), _top_y+100);
    path.lineTo(_top_x+(0.8*width)+(text.length*5 as double), _top_y+100);
    path.lineTo(_top_x+(1.2*width)+(text.length*5 as double), _top_y);
    path.lineTo(_top_x, _top_y);
    canvas.drawPath(path, paint);
    textPainter.paint(canvas, Offset(_top_x-text.length*5, _top_y+50-textStyle.fontSize!/2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Line extends CustomPainter {

  double _start_x = 0.0;
  double _start_y = 0.0;
  double _end_x = 0.0;
  double _end_y = 0.0;

  Line(this._start_x, this._start_y, this._end_x, this._end_y);

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Path path = Path();
    // path.moveTo(_start_x, _start_y);
    // path.lineTo(_start_x, _end_y);
    // path.lineTo(_end_x, _end_y);

    canvas.drawLine(Offset(_start_x, _start_y), Offset(_end_x, _end_y), paint);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Dot extends CustomPainter{
  double _center_x;
  double _center_y;

  Dot(this._center_x,this._center_y,);

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..isAntiAlias = true
      // this color can be transparent if users do not want to see dot
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(_center_x, _center_y), 5, paint);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
