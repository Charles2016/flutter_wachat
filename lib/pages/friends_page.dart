import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FriendsPageState();
  }
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('联系人'),),
      body: const Center(
        child: Text('联系人'),
      ),
    );
  }
}