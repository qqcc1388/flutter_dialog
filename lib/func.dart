
import 'package:flutter/material.dart';

class FunctionUtil{

   //显示中间弹窗
  static void popDialog(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return widget;
        });
  }

  //显示底部弹窗
  static void bottomSheetDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return widget;
      },
    );
  }

  //返回上一级
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  //push到下一级
  static Future push(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}