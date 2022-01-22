import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flowchdart_beta.dart';
import 'AbstractFlowWidget.dart';
import 'StartEndWidget.dart';

class ReturnConditionWidget extends StatefulWidget with AbstractFlow{
  ReturnConditionWidget(
      {
        required this.child,
        required this.cond2,
        required this.text,
        required this.id,
        Key? key,
        this.height,
        this.textStyle,
      }) : super(key: key);

  final AbstractFlow? child;
  final AbstractFlow? cond2;
  final String text;
  final String id;

  late num? returnX;
  late num? returnY;
  late num? height;
  late TextStyle? textStyle;

  int getMaxChildWidth_con(){
    if(child == null){
      return text.length * 10;
    }

    int cLen = child!.getMaxChildWidth();

    if(childIsConditionWidget()){
      cLen += 150;
    }

    int cLen2 = cond2!.getMaxChildWidth();
    int maxLen = max(cLen2, cLen);
    // print(cLen);
    // print(cLen2);
    return max(text.length * 10, maxLen);
  }

  @override
  _ReturnConditionWidgetState createState() => new _ReturnConditionWidgetState();

}

class _ReturnConditionWidgetState extends State<ReturnConditionWidget> {

  @override
  Widget build(BuildContext context) {
    widget.initialHeight();
    widget.textStyle = widget.initialTextStyle();

    int across = widget.getMaxChildWidth_con();
    int num_child = widget.getNumsChild();

    double width = widget.text.length*10 as double < 50 ? 100 : widget.text.length*10 as double;

    if(widget.selfIsReturnWidget()){
      widget.returnWidget[widget.id] = [widget.center_x,widget.center_y+widget.height!];
    }

    if(widget.child != null){
      widget.child!.center_x = widget.center_x;
      widget.child!.center_y = widget.center_y+150+widget.height!;
      widget.child!.parentWidget = widget.parentWidget;
      widget.child!.returnWidget = widget.returnWidget;
    }
    if(widget.cond2 != null){
      widget.cond2!.center_x = widget.center_x+(width)+across;
      widget.cond2!.center_y = widget.center_y+150+widget.height!;
      widget.cond2!.parentWidget = widget.parentWidget;
      widget.cond2!.returnWidget = widget.returnWidget;
    }

    // widget.getReturnPosition();

    return Container(
        child: CustomPaint(
            painter: Condition(
                widget.center_x,
                widget.center_y,
                widget.text,
                widget.height!,
                widget.textStyle!,
            ),
            child: Stack(
              children: [
                CustomPaint(
                  painter: widget.childIsStartEndWidget() ? Line(widget.center_x, widget.center_y+2*widget.height!,widget.child!.center_x,widget.child!.center_y-50) : Line(widget.center_x, widget.center_y+2*widget.height!,widget.child!.center_x,widget.child!.center_y),
                  child: widget.child,
                ),
                CustomPaint(
                  painter: Dot(widget.center_x,widget.center_y+num_child*(widget.height!+150)-75),
                ),
                CustomPaint(
                  painter: Line(widget.center_x+(width), widget.center_y+widget.height!,widget.center_x+(width)+across,widget.center_y+widget.height!),
                  child: CustomPaint(
                    painter: widget.cond2 is StartEndWidget ? Line(widget.center_x+(width)+across,widget.center_y+widget.height!,widget.cond2!.center_x,widget.cond2!.center_y-50) : Line(widget.center_x+(width)+across,widget.center_y+widget.height!,widget.cond2!.center_x,widget.cond2!.center_y) ,
                    child: widget.cond2,
                  ),
                ),
              ],
            )
        )
    );
  }
}