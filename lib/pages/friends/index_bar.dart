import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config_common.dart';
import 'friends_page.dart';

class IndexBar extends StatefulWidget {
  final Function(String str) indexBarCallBack;
  IndexBar({this.indexBarCallBack});
  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  int getIndex(BuildContext context, Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    double y = box.globalToLocal(globalPosition).dy;
    var itemH = kScreenH(context) / 2 / INDEX_WORDS.length;
    int index = (y ~/ itemH).clamp(0, INDEX_WORDS.length - 1);
    return index;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
          child: Text(
        INDEX_WORDS[i],
        style: TextStyle(
          fontSize: 10,
          color: _textColor,
        ),
      )));
    }

    return Positioned(
      top: kScreenH(context) / 8,
      height: kScreenH(context) / 2,
      right: 0,
      width: 120,
      child: Row(
        children: [Container(
          alignment: Alignment(0, _indicatorY),
          width: 100,
          child: _indicatorHidden ? null : Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment(-0.2, 0),
              children: [
                Image(
                  image: AssetImage('images/气泡.png'),
                  width: 60,
                ),
                Text(_indicatorText, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),)],
            ),
          ),
        ),GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {
            int index = getIndex(this.context, details.globalPosition);
            String str = INDEX_WORDS[index];
            print('点击的位置是：' + index.toString() + '\t字符是：' + str);
            widget.indexBarCallBack(str);
            setState(() {
              _indicatorText = str;
              _indicatorHidden = false;
              _indicatorY = 2.3 / INDEX_WORDS.length * index - 1.1;
            });
          },
          onVerticalDragDown: (DragDownDetails details) {
            int index = getIndex(this.context, details.globalPosition);
            String str = INDEX_WORDS[index];
            print('--->点击的位置是：' + index.toString() + '\t字符是：' + str);
            widget.indexBarCallBack(str);
            setState(() {
              _indicatorText = str;
              _indicatorHidden = false;
              _indicatorY = 2.3 / INDEX_WORDS.length * index - 1.1;
              _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
              _textColor = Colors.white;
            });
          },
          onVerticalDragEnd: (DragEndDetails details) {
            setState(() {
              _indicatorHidden = true;
              _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
              _textColor = Colors.black;
            });
          },
          child: Container(
            color: _bkColor,
            child: Column(
              children: words,
            ),
          ),
        )],
      ),
    );
  }
}
