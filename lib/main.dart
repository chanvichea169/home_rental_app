import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(HomeRentalApp());

class HomeRentalApp extends StatelessWidget {
  const HomeRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Rental',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
