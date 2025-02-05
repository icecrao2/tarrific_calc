


import 'package:hive/hive.dart';

class HiveClient {
  late String _boxName;
  late Box _box;

  Future<void> setBoxName(String boxName) async {
    await Hive.openBox(_boxName);
    _box = Hive.box(_boxName);
  }

  Future<void> put({required String key, required dynamic value}) async {
    await _box.put(key, value);
  }

  Future<dynamic> read({required String key}) async {
    return await _box.get(key);
  }

  List readAll() {
    return _box.values.toList();
  }
}