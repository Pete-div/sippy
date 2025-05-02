import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalUserService {
  static const _userIdKey = 'local_user_id';
  static const _inviterNameKey = 'inviter_name';
  static const _inviteeNameKey = 'invitee_name';
static const _sessionIdKey = 'shared_session_id';
static const _creatorName = 'creator_name';

  /// Get or create a unique ID for the current user
  static Future<String> getOrCreateUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(_userIdKey);

    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString(_userIdKey, userId);
    }

    return userId;
  }

  /// Save the inviter's name
  static Future<void> saveInviterName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_inviterNameKey, name);
  }

  /// Get the inviter's name
  static Future<String?> getInviterName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_inviterNameKey);
  }

  /// Save the invitee's name (when they join)
  static Future<void> saveInviteeName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_inviteeNameKey, name);
  }
  static Future<void> saveCreatorName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_creatorName, name);
  }

  /// Get the invitee's name
  static Future<String?> getInviteeName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_inviteeNameKey);
  }
   static Future<String?> getCreatorName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_creatorName);
  }

static Future<void> saveSessionId(String sessionId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_sessionIdKey, sessionId);
}

static Future<String?> getSessionId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_sessionIdKey);
}

  /// Clear all local user data (optional for session reset)
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_inviterNameKey);
    await prefs.remove(_inviteeNameKey);
    await prefs.remove(_sessionIdKey);
        await prefs.remove(_creatorName);


  }
}
