import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedFontsWidget extends StatelessWidget {
  const ModifiedFontsWidget(
      {super.key, required this.text, required this.color, required this.size});

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mada(
          color: color, fontSize: size, fontStyle: FontStyle.italic),
    );
  }
}
