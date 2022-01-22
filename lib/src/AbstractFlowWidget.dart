import 'dart:math';

import 'package:chart_beta/src/ReturnConditionWidget.dart';
import 'package:chart_beta/src/ReturnOperationWidget.dart';
import 'package:chart_beta/src/StartEndWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConditionWidget.dart';
import 'OperationWidget.dart';

abstract class AbstractFlow implements StatefulWidget{
  late double center_x;
  late double center_y;
  late AbstractFlow? child;
  late String text;
  late num? height;
  late TextStyle? textStyle;
  late num? strokeWidth;
  late String? id;
  late List<AbstractFlow?> parentWidget = [];
  late Map<String?,List<double>> returnWidget = Map();
  late Map<String?,List<double>> collectWidget = Map();

  void addToList(){
    parentWidget.add(this);
  }

  void printList(){
    for(int i = 0; i < parentWidget.length ; i++){
      print(parentWidget[i]!.center_x);
    }
  }

  void initialHeight(){
    if(height == null){
      height = 50;
    }
  }

  TextStyle? initialTextStyle(){
    if(textStyle == null){
      return TextStyle(
          color: Colors.black,
          fontSize: 20
      );
    }
  }

  void initialStrokeWidth(){
    if(strokeWidth == null){
      strokeWidth = 3;
    }
  }

  bool selfIsReturnWidget(){
    if(this is ReturnConditionWidget || this is ReturnOperationWidget){
      return true;
    }else{
      return false;
    }
  }

  bool childIsStartEndWidget(){
    return child is StartEndWidget ? true : false;
  }

  bool childIsConditionWidget(){
    if(child is ConditionWidget || child is ReturnConditionWidget){
      return true;
    }else{
      return false;
    }
  }

  bool childIsOperationWidget(){
    return child is OperationWidget ? true : false;
  }

  int getMaxChildWidth(){
    if(child == null){
      return text.length * 10;
    }
    int cLen = child!.getMaxChildWidth();
    if(childIsConditionWidget()){
      cLen += 150;
    }
    return max(cLen, text.length * 10);
  }

  int getNumsChild(){
    if(child == null){
      return 0;
    }
    int cnt = child!.getNumsChild();
    return cnt+1;
  }

}