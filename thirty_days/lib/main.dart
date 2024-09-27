import 'package:flutter/material.dart';
import 'package:thirty_days/utils/colors.dart';
import 'package:thirty_days/widgets/authWidget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.orange,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          primaryColor: AppColors.bgColor,
          brightness: Brightness.light),
      home: const UserAuthWidget(),
    );
  }
}
