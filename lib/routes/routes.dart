
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pages/home_page.dart';
import 'package:flutter_pokemon/pages/splash_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'loading':  (_) =>  SplashPage(),
  'home': (_) => const HomePage(),
  
};