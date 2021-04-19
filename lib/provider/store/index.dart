
import 'package:MemberCenter/provider/user_provider.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart';

class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  static init({context, child}) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => UserProvider(),)
    //   ],
    //   child: child,
    // );
  }

    /// 这个方法是对Provider的of方法的再封装，个人感觉没必要,写在这里方便理解
    ///   通过Provider.of<T>(context)获取状态数据
  static T value<T>(context,{bool listen}) {
    if (listen != null) { // 组件内容无需简单，但点击要更改状态时添加listen:false
      return Provider.of(context, listen: listen);
    } else {
      return Provider.of(context);
    }
  }

  /// 这个方法是对Provider的Consumer方法的再封装，个人感觉没必要,写在这里方便理解
  ///  通过Consumer获取状态数据 用Consumer只会对包裹的组件内容进行刷新，
  /// 直接用of来获取数据会造成页面级的数据刷新
  /// Consumer2<T,T>、Consumer3<T,T,T>
  /// 也可用ProxyProvider 整合多个Provider
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }

  /// ChangeNotifierProvider 配合Selector使用可进行更局部的刷新，
  /// Selector只监听单条数据，只有该数据更新时才触发重绘
  /// Selector(
    // builder: (BuildContext context, int data, Widget child) {
    //   print('Text 2 重绘了。。。。。。。。。。');
    //   return Text(
    //     //获取数据
    //     'Text2 : ${data.toString()}',
    //     style: TextStyle(fontSize: 20),
    //   );
    // },
    // selector: (BuildContext context,
    //     CounterProvider counterProvider) {
    //   return counterProvider.value1;
    // }),

}