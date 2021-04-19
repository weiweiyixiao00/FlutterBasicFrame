import 'package:flutter/material.dart';

class MineTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MineTabState();
}

class MineTabState extends State<MineTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }

}