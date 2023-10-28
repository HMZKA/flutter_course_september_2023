import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static SharedPreferences? storage;
  static Future init() async {
    storage = await SharedPreferences.getInstance();
  }

  static Future setBool({required String key, required bool value}) async {
    await storage?.setBool(key, value);
  }

  static getStorage({required String key}) {
    return storage?.get(key);
  }
}
