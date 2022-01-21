import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';
import 'package:hive/hive.dart';

import '../config_common.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  MethodChannel _methodChannel = MethodChannel("mine_page/method");
  File _avatarFile;

  @override
  void initState() {
    super.initState();
    /*_methodChannel.setMethodCallHandler((call) {
      if (call.method == "imagePath") {
        String imagePath = call.arguments.toString().substring(7);
        setState(() {
          _avatarFile = File(imagePath);
        });
      }
      return null;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      children: [
        Container(
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    Column(
                      children: getCells(),
                    )
                  ],
                ))),
        Container(
          margin: EdgeInsets.only(top: 60, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage('images/相机.png'),
                height: 25,
              )
            ],
          ),
        )
      ],
    )));
  }

  List<Widget> getCells() {
    List<Widget> widgets = [
      Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(left: 0, top: 80, right: 0, bottom: 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _getImageFile();
                          //_methodChannel.invokeMethod("picture");
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: _avatarFile == null
                                  ? AssetImage('images/avatar_defualt.png')
                                  : FileImage(_avatarFile),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 80),
                            alignment: Alignment.centerLeft,
                            width: kScreenW(context) - 100 - 20 - 60,
                            height: 40,
                            child: Text(
                              '放学了别跑',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: kScreenW(context) - 70 - 20,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: kScreenW(context) - 70 - 20 - 60,
                                  child: Text(
                                    '微信号：abc188',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Container(
                                  child: Image(
                                    image: AssetImage('images/badge.png'),
                                    width: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Image(
                                    image: AssetImage('images/icon_right.png'),
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                height: 10,
                color: themeColor,
              ),
            ],
          ),
        ),
      )
    ];

    for (int i = 0; i < datas.length; i++) {
      widgets.add(DiscoverCell(
        map: datas[i],
      ));
    }
    return widgets;
  }

  List<Map> datas = [
    {
      'title': '支付',
      'imageName': 'images/微信 支付.png',
      'sLine': '1',
    },
    {
      'title': '收藏',
      'imageName': 'images/微信收藏.png',
    },
    {
      'title': '相册',
      'imageName': 'images/微信相册.png',
    },
    {
      'title': '卡包',
      'imageName': 'images/微信卡包.png',
    },
    {
      'title': '表情',
      'imageName': 'images/微信表情.png',
      'sLine': '1',
    },
    {
      'title': '设置',
      'imageName': 'images/微信设置.png',
      'sLine': '1',
    }
  ];

   _getImageFile() async {
     try {
       XFile file = await ImagePicker().pickImage(source: ImageSource.gallery) as XFile;
       setState(() {
         _avatarFile = File(file.path);
       });
     } catch(e){
       print(e.toString());
       setState(() {
         _avatarFile = null;
       });
     }
  }
}
