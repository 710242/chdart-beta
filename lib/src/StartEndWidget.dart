import 'package:flutter/cupertino.dart';

import '../flowchdart_beta.dart';
import 'AbstractFlowWidget.dart';

class StartEndWidget extends StatefulWidget with AbstractFlow{
  StartEndWidget(
      {
        required this.center_x,
        required this.center_y,
        required this.child ,
        required this.text,
        required this.is_end,
        Key? key,
        this.textStyle,
      }) : super(key: key);

  final double center_x;
  final double center_y;
  final AbstractFlow? child;
  final String text;
  final bool is_end;

  late TextStyle? textStyle;

  @override
  _StartEndWidgetState createState() => new _StartEndWidgetState();

}

class _StartEndWidgetState extends State<StartEndWidget>{

  @override
  Widget build(BuildContext context) {
    widget.textStyle = widget.initialTextStyle();

    if(widget.child != null){
      widget.child!.center_x = widget.center_x;
      widget.child!.center_y = widget.center_y+150;
      widget.child!.parentWidget = widget.parentWidget;
      widget.child!.returnWidget = widget.returnWidget;
    }
    return Container(
      child: CustomPaint(
        painter: Start_end(
            widget.center_x,
            widget.center_y,
            100,
            widget.text,
            widget.textStyle!,
        ),
        child: CustomPaint(
          // this should be done directly
          // center_y+100 100 is radius
          // painter: Line(widget.center_x,widget.center_y+100,childx,childy),
          // painter: widget.is_end == false ? Line(widget.center_x,widget.center_y+100,widget.center_x,widget.center_y+150) :Line(widget.center_x,widget.center_y-100,widget.center_x,widget.center_y-150) ,
          painter: widget.is_end == false ? Line(widget.center_x,widget.center_y+50,widget.child!.center_x,widget.child!.center_y) : null,
          child: widget.is_end == false ? widget.child : null,
        ),
      ),
    );
  }
}
