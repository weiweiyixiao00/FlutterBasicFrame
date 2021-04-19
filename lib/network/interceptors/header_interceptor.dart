import 'package:dio/dio.dart';


class HeaderInterceptors extends InterceptorsWrapper {
  // @override
  // onRequest(RequestOptions options) async {
  //   ///超时
  //   options.connectTimeout = 15 * 1000;
  //   // options.baseUrl = Config.getHost()[ConstKey.HOST];
  //   return options;
  // }
  onRequest(options, handler){
    // 超时
    options.connectTimeout = 15 * 1000;
    return handler.next(options);
  }
}
