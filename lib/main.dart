import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_list/my_home_page.dart';
import 'package:todo_app_list/task_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //hi am nikhil


  final applicatonDocumentDir =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TODOs');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple TODO App Using Hive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}