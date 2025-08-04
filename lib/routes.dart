import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/profile_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomeScreen(),
  '/details': (context) => DetailScreen(),
  '/profile': (context) => ProfileScreen(),
};
