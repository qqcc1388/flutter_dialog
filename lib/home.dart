import 'package:flutter/material.dart';
import 'package:flutter_dialog/alert_dialog.dart';
import 'package:flutter_dialog/const.dart';
import 'package:flutter_dialog/cupertino_dialog.dart';
import 'package:flutter_dialog/func.dart';
import 'package:flutter_dialog/sheet_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Dialog'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: ColorConst.Color_Font_Orange,
                child: FlatButton(
                  onPressed: () {
                    FunctionUtil.bottomSheetDialog(
                      context,
                      ShowSheetDialog(
                        items: ['相册', '相机'],
                        title: '请选择图片来源',
                        onTap: (index) {
                          print('object$index');
                        },
                      ),
                    );
                  },
                  child: Text(
                    'actionSheet\npop',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: ColorConst.Color_Font_Red,
                child: FlatButton(
                  onPressed: () {
                    FunctionUtil.bottomSheetDialog(
                      context,
                      ShowCupertinoDialog(
                        items: ['北京', '上海', '天津', '深圳', '武汉', '广州', '杭州'],
                        onTap: (int index, String res) {
                          print('object$index + $res');
                        },
                      ),
                    );
                  },
                  child: Text(
                    'cupertino\npop',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: ColorConst.Color_Font_Gray,
                child: FlatButton(
                  onPressed: () {
                    FunctionUtil.popDialog(
                      context,
                      ShowAlertDialog(
                        items: ['取消', '确认'],
                        title: '提示',
                        content: '确认要退出登录吗？',
                        onTap: (index) {
                          print('object$index');
                        },
                      ),
                    );
                  },
                  child: Text(
                    'alert\npop',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
