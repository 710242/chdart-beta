import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:chart_beta/flowchdart_beta.dart';
import 'package:chart_beta/src/ConditionWidget.dart';
import 'package:chart_beta/src/StartEndWidget.dart';
import 'package:chart_beta/src/OperationWidget.dart';
import 'package:chart_beta/src/FlowChdartWidget.dart';
import 'package:chart_beta/src/ReturnConditionWidget.dart';
import 'package:chart_beta/src/ReturnOperationWidget.dart';

enum _KeyType { Black, White }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion;
    try {
      platformVersion = await FlowchdartBeta.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  double start_x = 100.0;
  double start_y = 100.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FlowChdartWidget(
          height: 100,
          width: 100,
          child: StartEndWidget(
            center_x: 500.0,
            center_y: 100.0,
            text: 'Start',
            is_end: false,
            child: ReturnConditionWidget(
              id: 'return0',
              text: 'testsfioj',
              child: ConditionWidget(
                text: 'tests',
                child: OperationWidget(
                  text: 'ouo',
                  child: StartEndWidget(
                    center_x: 500.0,
                    center_y: 900.0,
                    text: 'End',
                    is_end: true,
                    child: null,
                  ),
                ),
                cond2: StartEndWidget(
                  center_x: 500.0,
                  center_y: 900.0,
                  text: 'End',
                  is_end: true,
                  child: null,
                ),
              ),
              cond2: ReturnOperationWidget(
                id: 'return1',
                text: 'test',
                child: OperationWidget(
                  text: 'test',
                  returnid: 'return1',
                  child: null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}