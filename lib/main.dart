import 'package:color_order_match/config/di_setup.dart';
import 'package:color_order_match/config/router.dart';
import 'package:color_order_match/data/entity/record_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  diSetup();
  await Hive.initFlutter();
  Hive.registerAdapter<RecordEntity>(RecordEntityAdapter());
  await Hive.openBox('color_order_match.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Color Order Match',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}