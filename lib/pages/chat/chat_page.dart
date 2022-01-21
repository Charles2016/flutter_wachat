import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'chat_cell.dart';

class Chat {
  final String name;
  final String message;
  final String imageUrl;

  Chat({this.name, this.message, this.imageUrl});

  factory Chat.fromMap(Map map) {
    return Chat(
      name: map['name'],
      message: map['message'],
      imageUrl: map['imageUrl'],
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> _datas = [];
  bool _cancelConnect = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDatas().then((List<Chat> datas) {
      if (!_cancelConnect) {
        setState(() {
          _datas = datas;
        });
      }
    });
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信首页'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _datas.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatCell(data: _datas[index]);
            }),
        color: Colors.white,
      ),
    );
  }

  Future<List<Chat>> getDatas() async {
    _cancelConnect = false;
    final url =
        Uri.parse('http://rap2api.taobao.org/app/mock/256798/api/chat/list');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //获取响应数据,转成Map类型
      final responseBody = jsonDecode(response.body);
      //map 作为List的遍历方法。
      List chatList = responseBody['chat_list']
          .map<Chat>((item) => Chat.fromMap(item))
          .toList();
      print('chatList:$chatList');
      return chatList;
    } else {
      throw Exception('statusCode${response.statusCode}');
      return null;
    }
  }
}
