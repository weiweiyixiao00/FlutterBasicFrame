import 'dart:convert';
import 'package:MemberCenter/config/config.dart';
import 'package:dio/dio.dart';


class LogsInterceptors extends InterceptorsWrapper {
  static List<Map> sHttpResponses = new List<Map>();
  static List<String> sResponsesHttpUrl = new List<String>();

  static List<Map<String, dynamic>> sHttpRequest =
      new List<Map<String, dynamic>>();
  static List<String> sRequestHttpUrl = new List<String>();

  static List<Map<String, dynamic>> sHttpError =
      new List<Map<String, dynamic>>();
  static List<String> sHttpErrorUrl = new List<String>();

  @override
  onRequest(options, handler) async {
    if (Config.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('Body参数: ' + options.data.toString());
      }
      if (options.queryParameters != null) {
        print('Query参数: ' + options.queryParameters.toString());
      }
    }
    try {
      addLogic(sRequestHttpUrl, options.path ?? "");
      var data = options.data ?? Map<String, dynamic>();
      var map = {
        "header:": options.headers,
      };
      if (options.method == "POST") {
        map["data"] = data;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      print(e);
    }
    return handler.next(options);
  }

  @override
  onResponse(response,handler) async {
    if (Config.DEBUG) {
      if (response != null) {
        print('返回结果: ' + response.toString());
      }
    }
    if (response.data is Map || response.data is List) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response?.requestOptions?.uri?.toString() ?? "");
        addLogic(sHttpResponses, data);
      } catch (e) {
        print(e);
      }
    } else if (response.data is String) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response?.requestOptions?.uri.toString() ?? "");
        addLogic(sHttpResponses, data);
      } catch (e) {
        print(e);
      }
    } else if (response.data != null) {
      try {
        String data = response.data.toJson();
        addLogic(sResponsesHttpUrl, response?.requestOptions?.uri.toString() ?? "");
        addLogic(sHttpResponses, json.decode(data));
      } catch (e) {
        print(e);
      }
    }
    return handler.next(response); // continue
  }

  @override
  onError(DioError err, handler) async {
    if (Config.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    try {
      addLogic(sHttpErrorUrl, err.requestOptions.path ?? "null");
      var errors = Map<String, dynamic>();
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      print(e);
    }
    return handler.next(err); // continue;
  }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }
}
