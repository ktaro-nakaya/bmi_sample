import 'package:bmi_sample/provider/bmi_state.dart';
import 'package:bmi_sample/ui/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BmiState(),
        child: const MaterialApp(home: InputPage()));
  }
}
