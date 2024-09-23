import 'package:flutter/material.dart';
import 'package:thirty_days/utils/colors.dart';
import 'package:thirty_days/widgets/content.dart';

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: AppColors.shadows),
          child: const ContentWidget(),
        ),
      ),
    );
  }
}
