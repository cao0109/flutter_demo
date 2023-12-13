import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  //存储
  Future<bool> setValue(String key, dynamic value) {
    if (value is String) {
      return _preferences.setString(key, value);
    } else if (value is bool) {
      return _preferences.setBool(key, value);
    } else if (value is int) {
      return _preferences.setInt(key, value);
    } else if (value is double) {
      return _preferences.setDouble(key, value);
    } else if (value is List<String>) {
      return _preferences.setStringList(key, value);
    } else {
      throw Exception('Invalid data type');
    }
  }

  //获取
  dynamic getValue(String key) {
    return _preferences.get(key);
  }

  //删除
  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  //清空
  Future<bool> clear() async {
    return await _preferences.clear();
  }

  //是否存在
  bool hasKey(String key) {
    return _preferences.containsKey(key);
  }

  //获取所有key
  Set<String> getKeys() {
    return _preferences.getKeys();
  }

  //获取所有value
  List<dynamic> getValues() {
    return _preferences.getKeys().map((key) => _preferences.get(key)).toList();
  }

  //获取所有键值对
  Iterable<MapEntry<String, Object?>> getAll() {
    return _preferences
        .getKeys()
        .map((key) => MapEntry(key, _preferences.get(key)));
  }
}
