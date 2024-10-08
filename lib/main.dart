import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serene/pages/splash_page.dart';
import 'package:serene/providers/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init hive
  await Hive.initFlutter();
  //open a box
  await Hive.openBox('mybox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
