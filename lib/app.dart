import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: XTheme.light(),
      darkTheme: XTheme.dark(),
      home: Scaffold(body: Container()),
    );
  }
}
