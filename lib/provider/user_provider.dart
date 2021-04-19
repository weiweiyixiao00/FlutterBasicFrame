import 'package:MemberCenter/models/memeber_info.dart';
import 'package:flutter/material.dart';

class UserProvider extends MemberInfo with ChangeNotifier{
  MemberInfo _user = new MemberInfo();
  String _id = "239825";


  String get userName => _user.memberName;


  String get id => _id;

  void setLoginStatus (bool isLogin) {
    notifyListeners();
  }

  void setUser (MemberInfo user) {
    _user = user;
    notifyListeners();
  }

  void setUserName (String name) {
    _user.memberName = name;
    notifyListeners();
  }
}