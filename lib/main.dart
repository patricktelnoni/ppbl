import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppbl/customwidget/custom_wiget.dart';
import 'package:ppbl/gesture/gesture.dart';
import 'package:ppbl/gesture/custom_gesture_button.dart';
import 'package:ppbl/gesture/scale_example.dart';
import 'package:ppbl/gesture/transform_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Aplikasi Open StreetMap",

      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 120.0,
              fontWeight: FontWeight.w400,

          ),
          displayMedium: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w200
          ),
          headlineMedium: GoogleFonts.lato(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.75
          )
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple,
            backgroundColor: Colors.purpleAccent,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: AnimatedScaleExample(),
    );



  }
}
