import 'package:MemberCenter/pages/main_tab/home_tab.dart';
import 'package:MemberCenter/pages/main_tab/mine_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Widget> tabs = new List();
  PageController pageController = new PageController();
  @override
  void initState() {
    super.initState();
    tabs
      ..add(new HomeTab())
      ..add(new MineTab());
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: Size(750/2, 1334/2), allowFontScaling: false);
    return Scaffold(
      body: Container(
        child: PageView.builder(
          //要点1
          physics: NeverScrollableScrollPhysics(),
          //禁止页面左右滑动切换
          controller: pageController,
          onPageChanged: (int index){
            setState(() {
              if (_currentIndex != index) _currentIndex = index;
            });
          },
          //回调函数
          itemCount: tabs.length,
          itemBuilder: (context, index) => tabs[index]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        currentIndex: _currentIndex,
        onTap: (int i) {
          pageController.jumpToPage(i);
          //设置状态栏主题为深色
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
      ),
    );
  }
}