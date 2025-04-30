import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalUserService {
  static const _key = 'local_user_id';

  static Future<String> getOrCreateUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(_key);

    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString(_key, userId);
    }

    return userId;
  }
}