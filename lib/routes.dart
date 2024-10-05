import 'package:get/get.dart';
import 'package:homework_list/views/task_screen/screen/task_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/taskListScreen', page: () => TaskListScreen())
];
