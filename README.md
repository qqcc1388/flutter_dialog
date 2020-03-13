在flutter中弹窗从底部弹窗用showModalBottomSheet 从中间弹窗用showDialog，下面通过这两个弹窗自定义了一下常用样式
<div style="text-align:left">
<img src="https://github.com/qqcc1388/flutter_dialog/blob/master/resource/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-13%20at%2016.43.22.png" width="24%" height="25%">  <img src="https://github.com/qqcc1388/flutter_dialog/blob/master/resource/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-13%20at%2016.45.54.png" width="24%" height="25%">  <img src="https://github.com/qqcc1388/flutter_dialog/blob/master/resource/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-13%20at%2017.10.40.png" width="24%" height="25%">  <img src="https://github.com/qqcc1388/flutter_dialog/blob/master/resource/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-13%20at%2017.12.54.png" width="24%" height="25%">
</div>

### 显示底部弹窗
```
  static void bottomSheetDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return widget;
      },
    );
  }
```
如果isScrollControlled=false，弹窗部分最大高度只能我屏幕宽度的一半，如果为true,则没有这个限制
 1、底部弹窗样式一：通用sheet样式弹窗，这种弹窗在苹果系统中是有的
    具体代码
```
import 'package:flutter/material.dart';
import 'package:tudou_app/utils/const.dart';
import 'package:tudou_app/utils/func.dart';
import 'package:tudou_app/utils/scale.dart';

class ShowSheetDialog extends StatefulWidget {
  //按钮title
  List<String> items = [];
  //点击事件回调 0开始
  Function onTap;
  //标题 可选
  String title;

  ShowSheetDialog({
    @required this.items,
    this.onTap,
    this.title,
  });

  @override
  _ShowSheetDialogState createState() => _ShowSheetDialogState();
}

class _ShowSheetDialogState extends State<ShowSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.Color_BG,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //有标题的情况下
          (widget.title != null && widget.title.length > 0)
              ? Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: ColorConst.Color_Font_LightGray,
                        fontSize: FONT_SCALE(14)),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConst.Color_Font_White,
                    border: Border(
                      bottom: BorderSide(
                          color: ColorConst.Color_Split_Line, width: 1),
                    ),
                  ),
                )
              : Container(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.items.map((title) {
              int index = widget.items.indexOf(title);
              return GestureDetector(
                onTap: () {
                  FunctionUtil.pop(context);
                  widget.onTap(index);
                },
                child: _itemCreat(title),
              );
            }).toList(),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: _itemCreat('取消'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _itemCreat(String title) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(color: ColorConst.Color_Split_Line, width: 1)),
      ),
    );
  }
}

```
2、底部弹窗样式二：Cupertino样式弹窗

具体代码
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//用来显示底部弹出 可滚动视图的
class ShowCupertinoDialog extends StatefulWidget {
  //内容
  List<String> items;
  //选中回调 (int,String) 对应的下标和对应的值
  Function onTap;

  ShowCupertinoDialog({
    @required this.items,
    this.onTap,
  });
  @override
  _ShowCupertinoDialogState createState() => _ShowCupertinoDialogState();
}

class _ShowCupertinoDialogState extends State<ShowCupertinoDialog> {


  @override
  Widget build(BuildContext context) {
    var selectIndex;
    return Container(
      height: 280,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('确定'),
                splashColor: Colors.grey,
                highlightColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  if(selectIndex == null && widget.items.length > 0){
                    selectIndex = 0;
                  }
                  if (widget.onTap != null) {
                    widget.onTap(selectIndex, widget.items[selectIndex]);
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: CupertinoPicker(
              children: widget.items.map((item) {
                return Text(item);
              }).toList(),
              onSelectedItemChanged: (index) {
                print('$index');
                selectIndex = index;
              },
              itemExtent: 36,
            ),
          ),
        ],
      ),
    );
  }
}
```

### 中间弹窗
```
  static void popDialog(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          return widget;
        });
  }
```
具体代码
```
import 'package:flutter/material.dart';
import 'package:tudou_app/utils/const.dart';
import 'package:tudou_app/utils/func.dart';
import 'package:tudou_app/utils/scale.dart';

class ShowAlertDialog extends StatefulWidget {
  // 内容区域布局
  TextAlign contentAlign;

  String title;

  String content;
  // 点击返回index 0 1
  Function onTap;
  //按钮
  List<String> items;

  ShowAlertDialog({
    this.contentAlign = TextAlign.left,
    this.onTap,
    @required this.items,
    this.content,
    this.title,
  });

  @override
  _ShowAlertDialogState createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConst.Color_Clear,
      child: Center(
        // ClipRRect 创建圆角矩形 要不然发现下边button不是圆角
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: ColorConst.Color_Font_White,
            width: SIZE_SCALE(260),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontWeight: FontWeight.bold,
                      fontSize: FONT_SCALE(17)),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontSize: FONT_SCALE(14),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorConst.Color_Split_Line,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                _itemCreat(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemCreat() {
    return Container(
      child: Row(
        children: widget.items.map((res) {
          int index = widget.items.indexOf(res);
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                FunctionUtil.pop(context);
                widget.onTap(index);
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  res,
                  style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontSize: FONT_SCALE(15)),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: ColorConst.Color_Split_Line,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

```
这里提供的集中dialog都是项目中用到的，如果你的项目中有其他样式需求，可以自行修改源代码

转载请标注来源：https://www.cnblogs.com/qqcc1388/p/12487760.html