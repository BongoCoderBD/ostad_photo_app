import 'package:flutter/material.dart';

import 'Screens/photoList.dart';

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PhotoListScreen(),
    );
  }
}
