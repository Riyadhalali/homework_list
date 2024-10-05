import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;

  // Reactive ThemeMode variable
  var themeMode = ThemeMode.system.obs;

  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // Load the saved theme mode
    loadThemeMode();

    return this;
  }

  // Method to load the theme mode from SharedPreferences
  void loadThemeMode() {
    final themeIndex =
        sharedPreferences.getInt('themeMode') ?? 0; // Default to system mode
    themeMode.value = ThemeMode.values[themeIndex];
  }

  // Method to save the theme mode to SharedPreferences and update the reactive variable
  Future<void> saveThemeMode(ThemeMode newThemeMode) async {
    themeMode.value = newThemeMode;
    await sharedPreferences.setInt('themeMode', newThemeMode.index);
  }
}

// Ensure MyService is initialized before the app starts
Future<void> initialServices() async {
  await Get.putAsync(() => MyService().init());
}
