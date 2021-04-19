import 'package:MemberCenter/config/const_key.dart';
import 'package:MemberCenter/utils/local_storage.dart';
import 'package:dio/dio.dart';


class TokenInterceptors extends InterceptorsWrapper {
  // 正式
  String _token;
  // String _token = 'Bearer1000000697073954-1612855755943575#7B7/lXjiJEUIjReMgztI3MvSsnxYFoIJmgG6O4nCS6ht50YToDDpnNZUdq+e05Oj';
  // String _token = 'Bearer1000001071209435-1608625457559768#Y1PLfgsgG7IMyje5YxGOdte/rpTLbtOIKzlCbJ5S+08uQLeVAyPqDlvtQkf5dHpN';
  // String _token = 'Bearer1000000989260716-1611899462476837#7B7/lXjiJEUIjReMgztI3IGdVkG3vP8ZzcaY74yltuDYqiuANKMuKD0/Q0Uyv6yQ';
  // 测试
  // String _token = 'Bearer1000001887764832-1611736414607168#s6tTd8uhDuOZO9OqkejNZGiXZouLjGih05ZDqeXsYIhEUcrGUSmd2x8qZ5IxbuWb';
  // String _token = 'Bearer1000001887764832-1611736414607168#s6tTd8uhDuOZO9OqkejNZO1Lu/LJQG8djq/KinKk4HHehVXn3R73mIEWwQK6iqk1';

  @override
  onRequest(RequestOptions options, handlder) async {
    //授权码
    if (_token == null || _token == '') {
      var token = await getAuthorization();
      if (token != null && token != '') {
        _token = 'Bearer' + token;
      }
    }
    options.headers['TokenAuthorization'] = _token ?? '';
    return handlder.next(options);
  }

  @override
  onResponse(Response response, handler) async {
    // try {
    //   var responseJson = response.data;
    //   if (response.statusCode == 201 && responseJson["token"] != null) {
    //     _token = 'token ' + responseJson["token"];
    //     await LocalStorage.save(Const.TOKEN_KEY, _token);
    //   }
    // } catch (e) {
    //   print(e);
    // }
    return handler.next(response);
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    Storage.remove(ConstKey.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await Storage.get(ConstKey.TOKEN_KEY);
    this._token = token;
    // print('全局token:$token');
    return token;
  }
}
