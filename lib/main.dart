import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Widget/Bottom_Navigation.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1E1C67)
    , // Color for the status bar background
      statusBarIconBrightness: Brightness.light, // Brightness of the status bar icons
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'GuzoGo',

      home: const AppBarWithBottomNav(),
    );
  }
}

