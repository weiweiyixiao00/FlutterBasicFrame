import 'package:flutter/material.dart';

class RecordList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RecordListState();
}

class RecordListState extends State<RecordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员记录'),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }

}