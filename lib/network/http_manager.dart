import 'package:MemberCenter/config/config.dart';
import 'package:MemberCenter/config/const_key.dart';
import 'package:MemberCenter/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:collection';

import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';


///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager() {
    _dio.interceptors.add(new HeaderInterceptors());

    _dio.interceptors.add(_tokenInterceptors);

    _dio.interceptors.add(new LogsInterceptors());

    // _dio.interceptors.add(new ErrorInterceptors(_dio));

    _dio.interceptors.add(new ResponseInterceptors());
  }


  /*
   * 统一get请求
   */
  Future<dynamic> getData(String url, { Map<String, dynamic> params, RequestOptions options, Map<String, dynamic> header}) async {

    Map<String, dynamic> _headers = new HashMap();
    if (header != null) {
      _headers.addAll(header);
    }

    RequestOptions _options = options ?? RequestOptions(baseUrl: ConstKey.BASE_URL);
    if (_options.headers != null) {
      _options.headers.addAll(_headers);
    } else {
      _options.headers = _headers;
    }
    _options.queryParameters = params;
    _options.method = 'GET';

    Response response;
    try {
      _dio.interceptors.add(new TokenInterceptors());
      // response = await _dio.get(url, queryParameters: params, options: _options);
      response = await _dio.fetch(options);
    } on DioError catch (e) {
      if (Config.DEBUG) {
        Utils.showToast('网络请求异常');
      }
      print('网络请求异常: ' + e.toString());
    }
    var data = response?.data ?? Map();
    if (data is DioError) {
      if (Config.DEBUG) {
        Utils.showToast('网络请求异常');
      }
      print('网络请求异常: ' + data.toString());
    }

    if(data is String) {
      data = jsonDecode(data);
    }

    if(data['success'] != null && data['success']) {
      return data;
    } else if(data['message'] != null){
      Utils.showToast(data['message']);
      return data;
    }
  }


  /*
   *  统一post请求
   */
  Future<dynamic> postData(String url, { dynamic params, RequestOptions options, Map<String, dynamic> header, bool query = false}) async {

    Map<String, dynamic> _headers = new HashMap();
    if (header != null) {
      _headers.addAll(header);
    }

    RequestOptions _options = options ?? RequestOptions(baseUrl: ConstKey.BASE_URL);
    if (_options.headers != null) {
      _options.headers.addAll(_headers);
    } else {
      _options.headers = _headers;
    }
    _options.queryParameters = query ? params : null;
    _options.method = 'POST';

    Response response;
    try {
      _dio.interceptors.add(new TokenInterceptors());
      // response = await _dio.post(url,
      // data: params,
      // queryParameters: query ? params : null,
      // options: _options);
      response = await _dio.fetch(_options);
    } on DioError catch (e) {
      Utils.showToast('网络请求异常:' + e.toString());
      print('网络请求异常: ' + e.toString());
    }
    var data = response?.data ?? Map();
    if (data is DioError) {
      Utils.showToast('网络请求异常:' + data.toString());
      print('网络请求异常: ' + data.toString());
    }

    if(data is String) {
      data = jsonDecode(data);
    }

    if(data['success'] != null && data['success']) {
      return data;
    } else if(data['message'] != null){
      Utils.showToast(data['message']);
    }
  }

}

final HttpManager httpManager = new HttpManager();
