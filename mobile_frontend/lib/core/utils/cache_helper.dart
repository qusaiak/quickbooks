// import 'dart:convert';
//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../../injection_container.dart';
//
// class SecureStorage {
//   static const String isOnboardingKey = "isOnboarding";
//   static const String languageCodeKey = "languageCode";
//   static const String isLightKey = "isLight";
//   static const String mobileKey = "mobile";
//   static const String sessionIdKey = "session_id";
//   static const String firstNameKey = "first_name";
//   static const String lastNameKey = "last_name";
//   static const String genderKey = "gender";
//   static const String userCityKey = "userCity";
//   static const String userDateOfBirthKey = "userDateOfBirth";
//   static const String userProfilePhotoKey = "userProfilePhoto";
//   static const String pushNotificationsKey = "pushNotifications";
//   static const String recentSearchesListKey = "recentSearchesList";
//   static const String subscriptionExpiredKey = "subscriptionExpired";
//   static const String connectionTypeKey = "connectionType";
//
//   static FlutterSecureStorage? storage;
//
//
//   static Future<void> writeSecureList(
//       {required String key, required List<dynamic> list}) async {
//     String encodedList = jsonEncode(list);
//     await storage!.write(key: key, value: encodedList);
//   }
//
//   static Future<List<dynamic>> readSecureList({required String key}) async {
//     String? encodedList = await storage!.read(key: key);
//     if (encodedList != null) {
//       return List<dynamic>.from(jsonDecode(encodedList));
//     }
//     return [];
//   }
//
//   static Future<bool> readSecureBoolean({required String key}) async {
//     dynamic value = await storage?.read(key: key);
//     return value == 'true';
//   }
//
//   static Future<void> writeSecureData(
//       {required String key, required dynamic value}) async {
//     await storage!.write(
//       key: key,
//       value: value.toString(),
//     );
//   }
//
//   static dynamic readSecureData({required String key}) async {
//     String value = await storage!.read(key: key) ?? 'No data found!';
//     return value;
//   }
//
//   static Future<void> deleteSecureData({required String key}) async {
//     await storage!.delete(key: key);
//   }
//
//   static Future<void> storeAllSecureData() async {}
//
//   static Future<void> deleteAllSecureData() async {
//     await deleteSecureData(key: mobileKey);
//     await deleteSecureData(key: sessionIdKey);
//     await deleteSecureData(key: firstNameKey);
//     await deleteSecureData(key: lastNameKey);
//     await deleteSecureData(key: genderKey);
//     await deleteSecureData(key: userCityKey);
//     await deleteSecureData(key: userDateOfBirthKey);
//     await deleteSecureData(key: userProfilePhotoKey);
//     await deleteSecureData(key: pushNotificationsKey);
//     mobile = null;
//     sessionId = null;
//     firstName = null;
//     lastName = null;
//     gender = null;
//     userCity = null;
//     userDateOfBirth = null;
//     userProfilePhoto = null;
//     pushNotifications = null;
//   }
// }
