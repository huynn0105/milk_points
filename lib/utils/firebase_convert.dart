class FirebaseUtil {
  FirebaseUtil._();

  static Map<String, dynamic> convertObjectToMap(Object? obj) {
    final value = (obj as Map?) ?? {};
    return Map<String, dynamic>.from(value);
  }
}
