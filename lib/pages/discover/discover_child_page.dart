import 'package:flutter/material.dart';

class DiscoverChildPage extends StatelessWidget {
  final String titleStr;
  DiscoverChildPage({required this.titleStr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
      ),
      body: Center(
        child: Text(titleStr),
      ),
    );
  }

}