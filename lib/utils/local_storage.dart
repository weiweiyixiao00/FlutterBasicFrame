


import 'package:MemberCenter/config/const_key.dart';
import 'package:localstorage/localstorage.dart';

///本地存储
class Storage {
  static  final LocalStorage _storage = new LocalStorage(ConstKey.STOREAGE);

  static save(String key, String value) async {
    _storage.setItem(key, value);
  }

  static get(String key) async {
    return _storage.getItem(key);
  }

  static remove(String key) async {
    _storage.deleteItem(key);
  }
}
