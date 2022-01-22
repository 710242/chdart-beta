import 'package:flutter/cupertino.dart';

import '../flowchdart_beta.dart';
import 'AbstractFlowWidget.dart';

class ReturnOperationWidget extends StatefulWidget with AbstractFlow{
  ReturnOperationWidget(
      {
        required this.child,
        required this.text,
        required this.id,
        Key? key,
        this.returnid,
        this.textStyle
      }) : super(key: key);

  final AbstractFlow? child;
  final String text;
  final String id;

  late String? returnid;
  late TextStyle? textStyle;

  @override
  _ReturnOperationWidgetState createState() => new _ReturnOperationWidgetState();

}

class _ReturnOperationWidgetState extends State<ReturnOperationWidget> {

  @override
  Widget build(BuildContext context) {

    widget.textStyle = widget.initialTextStyle();

    if(widget.selfIsReturnWidget()){
      widget.returnWidget[widget.id] = [widget.center_x,widget.center_y];
    }

    if(widget.child != null){
      widget.child!.center_x = widget.center_x;
      widget.child!.center_y = widget.center_y+150;
      widget.child!.parentWidget = widget.parentWidget;
      widget.child!.returnWidget = widget.returnWidget;
    }

    return Container(
        child: CustomPaint(
          painter: Operation(
              widget.center_x,
              widget.center_y,
              widget.text,
              widget.textStyle!,
          ),
          child: CustomPaint(
            painter: widget.childIsStartEndWidget() ?
            Line(widget.center_x,widget.center_y+100,widget.child!.center_x,widget.child!.center_y-50)
                : Line(widget.center_x,widget.center_y+100,widget.child!.center_x,widget.child!.center_y),
            child: widget.child,
          ),
        )
    );
  }
}