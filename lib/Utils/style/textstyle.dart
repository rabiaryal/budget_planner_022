import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStylesOO {
  // Title style (bold and formal)
  static TextStyle title(BuildContext context) {
    return GoogleFonts.robotoSlab(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black, // Change color based on theme
      ),
    );
  }

  // Input text style (simple and modern)
  static TextStyle input(BuildContext context) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 24,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black, // Change color based on theme
      ),
    );
  }

  // Normal text style (bold and readable)
  static TextStyle normalText(BuildContext context) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black, // Change color based on theme
      ),
    );
  }

  // Label text style (attention-grabbing and decorative)
  static TextStyle label(BuildContext context) {
    return GoogleFonts.playfairDisplay(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.orangeAccent
            : Colors.orangeAccent, // Keep label color same for both themes, or change if needed
      ),
    );
  }

  // Button text style (clear and readable)
  static TextStyle button(BuildContext context) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.white, // Button text color remains the same across themes (or adjust as needed)
      ),
    );
  }
}
