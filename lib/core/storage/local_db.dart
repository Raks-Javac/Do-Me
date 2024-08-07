import 'dart:convert';

import 'package:dome/app_locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedLocalDB {
  Future<dynamic> getData(String key);
  Future<bool?> getBoolData(String key);
  Future<dynamic> getSecureData(String key);
  Future<dynamic> storeData(String key, dynamic data);
  Future<bool> storeBoolData(String key, bool data);
  Future<dynamic> storeSecureData(String key, dynamic data);
}

class LocalDb implements ISharedLocalDB {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future<dynamic> getSecureData(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<dynamic> storeData(String key, dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data.toString());
  }

  @override
  Future<dynamic> storeSecureData(String key, dynamic data) async {
    await _secureStorage.write(key: key, value: data.toString());
  }

  @override
  Future<bool?> getBoolData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<bool> storeBoolData(String key, bool data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, data);
  }
}

class BLocalDB {
  BLocalDB._();
  static BLocalDB instance = BLocalDB._();

  factory BLocalDB() {
    return instance;
  }

  static const onboardingKey = 'onboardingKey';

  //onboarding
  Future<bool> storeOnBoardingStatus(bool status) async {
    return await secureDbInstance.storeBoolData(onboardingKey, status);
  }

  Future<bool> getOnBoardingStatus() async {
    return await secureDbInstance.getBoolData(onboardingKey) ?? false;
  }

  static const loginInfo = 'loginInfo';

  //onboarding
  Future<dynamic>? storeloginInfoStatus(dynamic status) async {
    return await secureDbInstance.storeData(loginInfo, jsonEncode(status));
  }

  Future<dynamic>? getloginInfoStatus() async {
    final value = await secureDbInstance.getData(loginInfo);
    return value != null ? jsonDecode(value) : null;
  }
}
