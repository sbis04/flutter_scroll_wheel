import 'package:flutter/material.dart';
import 'package:flutter_scroll_wheel/simple_scroll_test.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Scroll Wheel Demo',
        home: SimpleScrollView(),
      );
}
