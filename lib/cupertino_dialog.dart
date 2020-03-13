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
                  if (selectIndex == null && widget.items.length > 0) {
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
