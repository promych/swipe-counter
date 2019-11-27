import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

abstract class CounterRepo {
  Future<int> get value;
  Future<void> saveValue(int value);
}

class LocalStorage implements CounterRepo {
  @override
  Future<int> get value async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter') ?? kDefaultCounterValue;
  }

  @override
  Future<void> saveValue(int value) async {
    await SharedPreferences.getInstance()
      ..setInt('counter', value);
  }
}
