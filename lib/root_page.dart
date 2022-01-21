import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/config_common.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  List <Widget> _pages = [ChatPage(),FriendsPage(),DiscoverPage(),MinePage()];
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState((){
            _currentIndex = index;
          });
        },
        selectedFontSize: 12.0,
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: getItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> getItems() {
    List<Map> datas = [
      {
        'labelStr': '消息',
        'imageStr': 'images/tabbar_chat.png',
        'imageHLStr': 'images/tabbar_chat_hl.png'
      },
      {
        'labelStr': '通讯录',
        'imageStr': 'images/tabbar_friends.png',
        'imageHLStr': 'images/tabbar_friends_hl.png'
      },
      {
        'labelStr': '发现',
        'imageStr': 'images/tabbar_discover.png',
        'imageHLStr': 'images/tabbar_discover_hl.png'
      },
      {
        'labelStr': '我的',
        'imageStr': 'images/tabbar_mine.png',
        'imageHLStr': 'images/tabbar_mine_hl.png'
      },
    ];
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < datas.length; i++) {
      Map mapTemp = datas[i];
      items.add(BottomNavigationBarItem(
          icon: Image.asset(
            mapTemp['imageStr'],
            height: 20,
            width: 20,
          ),
          activeIcon: Image.asset(
            mapTemp['imageHLStr'],
            height: 20,
            width: 20,
          ),
          label: mapTemp['labelStr']));
    }
    return items;
  }
}
