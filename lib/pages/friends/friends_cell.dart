import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';

import '../../config_common.dart';

class FriendsCell extends StatefulWidget {
  var data;

  FriendsCell({this.data});

  @override
  State<StatefulWidget> createState() {
      return _FriendsState();
  }
}

class _FriendsState extends State<FriendsCell> {
  @override
  Widget build(BuildContext context) {
    bool isShowTitle = (widget.data is Friends) && ((widget.data as Friends).groupTitle != null);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DiscoverChildPage(titleStr: widget.data is Friends ? (widget.data as Friends).name : widget.data['name'])));
      },
      child: Container(
          child: Column(
            children: [
              Container(
                width: kScreenW(context),
                height: isShowTitle ? 30 : 0,
                color: themeColor,
                child: isShowTitle ? Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Text((widget.data as Friends).groupTitle)
                ) : null,
              ),
              Row(
                children: [
                  if(widget.data is Friends)
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: NetworkImage((widget.data as Friends).imageUrl),
                            fit: BoxFit.cover,
                          )))
                  else
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: AssetImage(widget.data['avatar']),
                            fit: BoxFit.cover,
                          ))),
                  Text(
                    widget.data is Friends ? (widget.data as Friends).name : widget.data['name'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                height: 0.5,
                color: themeColor,
              )
            ],
          )
      ),
    );
  }
}
