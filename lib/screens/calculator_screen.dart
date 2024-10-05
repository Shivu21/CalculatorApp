import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/calculator_provider.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Text(
                calculator.currentInput.isEmpty
                    ? calculator.result
                    : calculator.currentInput,
                style: TextStyle(fontSize: 48),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                    text: '7', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '8', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '9', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '/', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '4', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '5', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '6', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '*', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '1', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '2', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '3', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '-', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: 'C', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '0', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '=', onPressed: calculator.buttonPressed),
                CalculatorButton(
                    text: '+', onPressed: calculator.buttonPressed),
                // Add the backspace button here
                CalculatorButton(
                  text: '←', // Display a backspace arrow symbol
                  onPressed: (value) =>
                      calculator.backspace(), // Trigger backspace function
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: calculator.history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(calculator.history[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
