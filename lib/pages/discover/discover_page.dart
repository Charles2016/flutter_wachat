import 'package:flutter/material.dart';
import 'package:wechat_demo/config_common.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscoverPageState();
  }
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('发现'),),
        body: Container(
          color: themeColor,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return DiscoverCell(map: datas[index]);
            },
            itemCount: datas.length,
          ),
        )
    );
  }

  List<Map> datas = [
    {
      'title': '朋友圈',
      'subTitle': '朋友圈子标题',
      'imageName': 'images/朋友圈.png',
      'subImageName':'images/badge.png',
      'sLine':'1',
    },
    {
      'title': '扫一扫',
      'imageName': 'images/扫一扫2.png',
    },
    {
      'title': '摇一摇',
      'imageName': 'images/摇一摇.png',
    },
    {
      'title': '看一看',
      'imageName': 'images/看一看icon.png',
    },
    {
      'title': '搜一搜',
      'imageName': 'images/搜一搜 2.png',
      'sLine':'1',
    },
    {
      'title': '附近的人',
      'imageName': 'images/附近的人icon.png',
      'sLine':'1',
    },
    {
      'title': '购物',
      'subTitle': '618限时特价',
      'imageName': 'images/购物.png',
      'subImageName':'images/badge.png',
    },
    {
      'title': '游戏',
      'imageName': 'images/游戏.png',
      'sLine':'1',
    },
    {
      'title': '小程序',
      'imageName': 'images/小程序.png',
      'sLine':'1',
    },
  ];
}