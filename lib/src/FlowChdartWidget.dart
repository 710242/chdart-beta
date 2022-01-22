import 'package:flutter/cupertino.dart';

import '../flowchdart_beta.dart';
import 'AbstractFlowWidget.dart';

class FlowChdartWidget extends StatefulWidget with AbstractFlow{
  FlowChdartWidget(
      {
        required this.child,
        required this.height,
        required this.width,
        Key? key,
      }) : super(key: key);

  final AbstractFlow child;
  final double width;
  final double height;

  @override
  _FlowChdartWidgetState createState() => new _FlowChdartWidgetState();

}

class _FlowChdartWidgetState extends State<FlowChdartWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: SingleChildScrollView(
          child: widget.child,
        ),
    );
  }
}