import 'package:flutter/material.dart';
import 'package:mealdb/home_page.dart';
import 'package:mealdb/meal_provide_page.dart';
import 'package:mealdb/search_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MealProvidePage(),
      ),
      ChangeNotifierProvider(create: (context) => SearchProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
