import 'package:MemberCenter/config/routes.dart';
import 'package:MemberCenter/provider/store/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  /**
   * 超级权限非加密方式初始化
   */
  // Bmob.initMasterKey("https://api2.bmob.cn", "5233aed84b237b28ab305f24c374844b","1b036d25b9f5d45efde0ba2ee51d406b","ea06dbc41e37b37e59f2d5fed3623381");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750/2, 1334/2),
        builder: () => MaterialApp(
          title: 'Flutter Learn',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: 'main',
          routes: Routes.routes,
          builder: (context, widget) {
            return MediaQuery(
              ///设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
        ),
      );
  }
}
