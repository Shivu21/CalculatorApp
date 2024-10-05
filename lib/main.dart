import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/calculator_provider.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        home: CalculatorScreen(),
      ),
    );
  }
}
  