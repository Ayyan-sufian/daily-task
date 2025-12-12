import 'package:daily_task/provider/bmi_provider.dart';
import 'package:daily_task/provider/counter_provider.dart';
import 'package:daily_task/provider/theme_provider.dart';
import 'package:daily_task/provider/user_provider.dart';
import 'package:daily_task/screens/bmi_screen.dart';
import 'package:daily_task/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BmiProvider()),
        ChangeNotifierProxyProvider<UserProvider, CounterProvider>(
          create: (_) => CounterProvider(),
          update: (_, user, counter) => counter!..updateName(user),
        ),


      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI App",
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
