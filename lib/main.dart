import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/binding/initial_binding.dart';
import 'package:homework_list/routes.dart';

import 'core/service/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeWork',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialBinding: InitialBinding(),
      getPages: routes,
      initialRoute: Routes.taskListScreen,
    );
  }
}
