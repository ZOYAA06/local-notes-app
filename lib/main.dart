import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/task.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Task>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'My Tasks',
      theme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF87A878),
  ),
  scaffoldBackgroundColor: const Color(0xFFF4F6F1),
),
      home: const HomeScreen(),
    );
  }
}