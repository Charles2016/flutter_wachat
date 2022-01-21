import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/config_common.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  // final String title;
  // final String? subTitle;
  // final String imageName;
  // final String? subImageName;
  final Map map;

  DiscoverCell({ this.map});

  @override
  State<StatefulWidget> createState() {
    return _DiscoverCellState();
  }
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiscoverChildPage(titleStr: widget.map['title'])));
      },
      onTapUp: (TapUpDetails details){
        setState(() {
          _bgColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details){
        setState(() {
          _bgColor = themeColor;
        });
      },
      onTapCancel: (){
        setState(() {
          _bgColor = Colors.white;
        });
      },
      child: Container(
        width: kScreenW(context),
        height: widget.map['sLine'] != null ? 64 : 54.5,
        color: _bgColor,
        child: Column(
          children: [
            Container(
              height: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //左侧
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(widget.map['imageName']),
                          height: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.map['title'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  //右侧
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        widget.map['subTitle'] != null
                            ? Text(
                          widget.map['title'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                            : Text(''),
                        widget.map['subImageName'] != null
                            ? Image(
                          image: AssetImage(widget.map['subImageName']),
                          height: 20,
                        )
                            : Container(),
                        Image(
                          image: AssetImage('images/icon_right.png'),
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.map['sLine'] != null
                ? Container(
              height: 10,
              color: themeColor,
            )
                : Container(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 0.5,
                width: kScreenW(context) - 40,
                color: themeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
