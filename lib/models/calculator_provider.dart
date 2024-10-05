import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class CalculatorProvider with ChangeNotifier {
  String _currentInput = '';
  String _result = '0';
  List<String> _history = [];

  String get currentInput => _currentInput;
  String get result => _result;
  List<String> get history => _history;

  void buttonPressed(String value) {
    if (value == 'C') {
      _clear();
    } else if (value == '=') {
      _calculate();
    } else {
      _addInput(value);
    }
    notifyListeners();
  }

  void _addInput(String value) {
    if (_currentInput.length < 10) {
      _currentInput += value;
    }
  }

  void _clear() {
    _currentInput = '';
    _result = '0';
  }

  void backspace() {
    if (_currentInput.isNotEmpty) {
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);
      notifyListeners();
    }
  }

  void _calculate() {
    try {
      _result = _evaluate(_currentInput);
      _history.add('$_currentInput = $_result');
      _currentInput = ''; // Clear the input after showing result
    } catch (e) {
      _result = 'Error';
    }
  }

  String _evaluate(String expressionStr) {
    // Parse and evaluate the expression
    Expression expression = Expression.parse(expressionStr);
    final evaluator = const ExpressionEvaluator(); // Custom evaluator
    var evalResult = evaluator.eval(expression, {});
    return evalResult.toString();
  }
}
