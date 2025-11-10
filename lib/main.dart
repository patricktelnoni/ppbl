import 'package:flutter/material.dart';
import 'package:ppbl/chart/chart_example.dart';
import 'package:ppbl/chart/barchart_example.dart';
import 'package:ppbl/chart/areachart_example.dart';
import 'package:ppbl/chart/candlestick_example.dart';
import 'package:ppbl/chart/piechart_example.dart';
import 'package:ppbl/chart/scatterchart_example.dart';
import 'package:ppbl/chart/radarchart_example.dart';
import 'package:ppbl/sharedpreference/shared_preference.dart';
import 'package:ppbl/sqlite/form_input.dart';
import 'package:ppbl/navigation/navigation.dart';
import 'package:ppbl/navigation/sidebar_example.dart';
import 'package:ppbl/navigation/goroute.dart';
import 'package:go_router/go_router.dart';


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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SideBarExample(),




    );



  }
}
