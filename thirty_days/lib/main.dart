import 'package:flutter/material.dart';
import 'package:thirty_days/utils/colors.dart';
import 'package:thirty_days/widgets/introducationWidget.dart';

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
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          primaryColor: AppColors.bgColor,
          brightness: Brightness.light),
      home: const IntroducationWidget(),
    );
  }
}
