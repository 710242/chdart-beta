import 'package:flutter/cupertino.dart';

import '../flowchdart_beta.dart';
import 'AbstractFlowWidget.dart';

class OperationWidget extends StatefulWidget with AbstractFlow{
  OperationWidget(
      {
        required this.child,
        required this.text,
        Key? key,
        this.returnid,
        this.textStyle,
      }) : super(key: key);

  final AbstractFlow? child;
  final String text;

  late String? returnid;
  late TextStyle? textStyle;

  @override
  _OperationWidgetState createState() => new _OperationWidgetState();

}

class _OperationWidgetState extends State<OperationWidget> {

  @override
  Widget build(BuildContext context) {

    widget.initialTextStyle();
    widget.textStyle = widget.initialTextStyle();

    if(widget.child != null){
      widget.child!.center_x = widget.center_x;
      widget.child!.center_y = widget.center_y+150;
      widget.child!.parentWidget = widget.parentWidget;
      widget.child!.returnWidget = widget.returnWidget;
    }

    // widget.printList();

    if(widget.returnid == null){
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
    }else{
      return Container(
          child: CustomPaint(
            painter: Operation(
                widget.center_x,
                widget.center_y,
                widget.text,
                widget.textStyle!,
            ),
            child: CustomPaint(
              painter: Line(widget.center_x,widget.center_y+100,widget.center_x,widget.center_y+150),
              child: CustomPaint(
                painter: Line(widget.center_x,widget.center_y+150,widget.center_x+150,widget.center_y+150),
                child: CustomPaint(
                  // the last 75 is the padding between all widget, that is the Line length
                  painter: Line(widget.center_x+150,widget.center_y+150,widget.center_x+150,widget.returnWidget[widget.returnid]![1]-75),
                  child: CustomPaint(
                    painter: Line(widget.center_x+150,widget.returnWidget[widget.returnid]![1]-75,widget.returnWidget[widget.returnid]![0],widget.returnWidget[widget.returnid]![1]-75),
                  ),
                ),
              ),
            ),
          )
      );
    }
  }
}