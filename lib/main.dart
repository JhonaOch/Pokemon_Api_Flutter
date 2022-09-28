
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'loading',
        routes:appRoutes,
    );
  }
}

