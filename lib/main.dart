import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:wechat_demo/root_page.dart';

import 'config_common.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:AppBarTheme(elevation: 0,color: themeColor),
        applyElevationOverlayColor: false,
        scaffoldBackgroundColor: themeColor,
        //取消点击底部栏阴影效果设置
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // primaryColorLight: Colors.green,
        //splashColor: themeColor,
        primarySwatch: getMaterialColor(themeColor),
      ),
      home: RootPage(),
    );
  }

  //调用的时候需要把hex改一下，比如#223344 needs change to 0xFF223344
  //即把#换成0xFF即可
  MaterialColor getMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (int i = 0; i < strengths.length; i++) {
      double strength = strengths[i];
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }
}
