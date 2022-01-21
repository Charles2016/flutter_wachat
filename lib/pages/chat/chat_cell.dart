import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/config_common.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';

class ChatCell extends StatefulWidget {
  final Chat data;

  ChatCell({this.data});

  @override
  _ChatCellState createState() => _ChatCellState();
}

class _ChatCellState extends State<ChatCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: kScreenW(context),
          height: 44,
          child: Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.data.imageUrl),
                  ),
                ),
              ),
              Container(
                  width: kScreenW(context) - 90,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.name == null ? '' : widget.data.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.data.message == null
                              ? ''
                              : widget.data.message,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ])),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 64),
          color: Colors.grey[300],
          height: 0.5,
          width: kScreenW(context),
        )
      ],
    );
  }
}
/*ListTile(
title: Text(widget.data.name),
subtitle: Container(
alignment: Alignment.bottomCenter,
padding: EdgeInsets.only(
right: 10,
),
height: 25,
child: Text(
widget.data.message,
overflow: TextOverflow.ellipsis,
),
),
leading: Container(
width: 44,
height: 44,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(6.0),
image: DecorationImage(image: NetworkImage(widget.data.imageUrl))),
),
);*/
