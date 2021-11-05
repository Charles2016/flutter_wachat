import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';

import 'config_common.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: Colors.green,
        splashColor:const Color.fromRGBO(1, 0, 0, 0.0),
        primarySwatch: Colors.grey,
      ),
      home:RootPage(),
    );
  }
}
