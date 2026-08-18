import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTextStyle {
  static TextStyle headerBoldPrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

  static TextStyle headerPrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

  static TextStyle titleBoldPrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

  static TextStyle titlePrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

  static TextStyle subTitleBoldPrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

  static TextStyle subTitlePrimary(BuildContext context) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );
}
