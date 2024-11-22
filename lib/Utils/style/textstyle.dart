import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStylesOO {
  // Title style (bold and formal)
  static TextStyle title = GoogleFonts.robotoSlab(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  // Input text style (simple and modern)
  static TextStyle input = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 24,
      color: Colors.black,
    ),
  );

  // TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

  static TextStyle normalText = GoogleFonts.roboto(
textStyle: const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
   color: Colors.black,
)

  );

  // Label text style (attention-grabbing and decorative)
  static TextStyle label = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.orangeAccent,
    ),
  );

  // Button text style (clear and readable)
  static TextStyle button = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}
