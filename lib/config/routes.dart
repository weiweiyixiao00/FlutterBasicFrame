import 'package:MemberCenter/pages/main_page.dart';
import 'package:MemberCenter/pages/record_list/record_list.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'main': (context) => MainPage(),
    'record_list': (context) => RecordList(),
  };
}