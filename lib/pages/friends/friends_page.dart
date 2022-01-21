import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/pages/friends/friends_cell.dart';
import 'package:wechat_demo/pages/friends/index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  double _cellHeight = 55.5;
  double _groupHeight = 30.0;
  //字典，里面放item和高度的对应的数据。
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };
  final ScrollController  _scrollController = ScrollController();
  List<Friends> _listDatas = [];
  @override
  void initState() {
    _listDatas
        ..addAll(datas)
        ..addAll(datas);
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });
    var groupOffset = _cellHeight * headDatas.length;
    for (int i = 0; i < _listDatas.length; i++) {
      //保存完了再加_groupOffset
      if (i == 0 || _listDatas[i].indexLetter != _listDatas[i - 1].indexLetter) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:groupOffset});
        Friends temp = Friends();
        temp.name = _listDatas[i].name;
        temp.imageUrl = _listDatas[i].imageUrl;
        temp.indexLetter = _listDatas[i].indexLetter;
        temp.groupTitle = temp.indexLetter;
        _listDatas.insert(i, temp);
        _listDatas.removeAt(i+1);
        groupOffset += _groupHeight;
      }
      groupOffset += _cellHeight ;
    }
    print('--->初始化state函数');
  }

  @override
  Widget build(BuildContext context) {
    print('--->build函数');
    return Scaffold(
        appBar: AppBar(
          title: Text('联系人'),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiscoverChildPage(titleStr: '添加好友')));
              },
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
                child: Image.asset('images/icon_friends_add.png'),
                height: 40,
                width: 60,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: headDatas.length + _listDatas.length,
                itemBuilder: (BuildContext context, int index) {
                  return index >= 4
                      ? FriendsCell(data: _listDatas[index - 4])
                      : FriendsCell(data: headDatas[index]);
                },
              ),
            ),
            IndexBar(indexBarCallBack: (String str){
              if (_groupOffsetMap[str] != null) {
                _scrollController.animateTo(_groupOffsetMap[str],
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn);
              }
            },),
          ],
        ));
  }

  List<Map> headDatas = [
    {
      'name': '新的朋友',
      'avatar': 'images/新的朋友.png',
    },
    {
      'name': '群聊',
      'avatar': 'images/群聊.png',
    },
    {
      'name': '标签',
      'avatar': 'images/标签.png',
    },
    {
      'name': '公众号',
      'avatar': 'images/公众号.png',
      'sLine': '1',
    },
  ];

  List<Friends> datas = [
    Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/27.jpg',
      name: 'Lina',
      indexLetter: 'L',
    ),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
        name: '菲儿',
        indexLetter: 'F'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
        name: '安莉',
        indexLetter: 'A'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
        name: '阿贵',
        indexLetter: 'A'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
        name: '贝拉',
        indexLetter: 'B'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/37.jpg',
        name: 'Lina',
        indexLetter: 'L'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg',
        name: 'Nancy',
        indexLetter: 'N'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/47.jpg',
        name: '扣扣',
        indexLetter: 'K'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        name: 'Jack',
        indexLetter: 'J'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
        name: 'Emma',
        indexLetter: 'E'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/24.jpg',
        name: 'Abby',
        indexLetter: 'A'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
        name: 'Betty',
        indexLetter: 'B'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
        name: 'Tony',
        indexLetter: 'T'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/26.jpg',
        name: 'Jerry',
        indexLetter: 'J'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg',
        name: 'Colin',
        indexLetter: 'C'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
        name: 'Haha',
        indexLetter: 'H'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
        name: 'Ketty',
        indexLetter: 'K'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/13.jpg',
        name: 'Lina',
        indexLetter: 'L'),
    Friends(
        imageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
        name: 'Lina',
        indexLetter: 'L'),
  ];
}

class Friends {
  Friends({this.imageAssets, this.imageUrl, this.name, this.indexLetter, this.groupTitle});

  final String imageAssets;
  String imageUrl;
  String name;
  String indexLetter;
  String groupTitle;
}

 const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];