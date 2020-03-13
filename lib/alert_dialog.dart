import 'package:flutter/material.dart';
import 'func.dart';
import 'const.dart';

class ShowAlertDialog extends StatefulWidget {
  // 内容区域布局
  TextAlign contentAlign;
  // 标题
  String title;
  //内容
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
            width: (260),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                (widget.title == null || widget.title.length == 0) ? Container() : Container(
                  child: Text(
                  widget.title,
                  style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontWeight: FontWeight.bold,
                      fontSize: (17)),
                ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontSize: (14),
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
                if(widget.onTap != null){
                  widget.onTap(index);
                }
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  res,
                  style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontSize: (15)),
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
