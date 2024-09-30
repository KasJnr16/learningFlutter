import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days/utils/fonts.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              right: -290,
              child: Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle),
              )),
          Positioned(
              left: 20,
              bottom: -470,
              child: Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle),
              )),
          Positioned(
            top: 5,
            left: 15,
            child: Container(
              height: 100,
              child: Image.asset(
                  "assets/png-transparent-logo-brand-visa-font-visa-blue-text-trademark-thumbnail-removebg-preview.png"),
            ),
          ),
          Positioned(
              left: 15,
              top: 70,
              child: ModifiedFontsWidget(
                  text: "It's where you want to be",
                  color: Colors.grey.shade900,
                  size: 20)),
          Positioned(
              bottom: 55,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5678 4356 0126 7800",
                    style: GoogleFonts.sourceCodePro(
                        fontSize: 24,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ABDULAI KASSIM JNR",
                    style: GoogleFonts.sourceCodePro(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          Positioned(
              top: 25,
              right: 15,
              child: Container(
                height: 70,
                child: Image.asset(
                  "assets/card-removebg-preview.png",
                ),
              ))
        ],
      ),
    );
  }
}
