import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class ThemeServices {
  final storageKey = "isDarkMode";

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return box.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    box.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
