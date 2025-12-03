import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Controllers for text input fields
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Result variable
  String _result = '0';

  // Operation type
  String _operation = '+';

  // Calculate function
  void _calculate() {
    try {
      double num1 = double.parse(_num1Controller.text);
      double num2 = double.parse(_num2Controller.text);
      double result = 0;

      switch (_operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '×':
          result = num1 * num2;
          break;
        case '÷':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            _result = 'Error: Division by zero';
            setState(() {});
            return;
          }
          break;
      }

      // Check if result is integer
      if (result == result.truncateToDouble()) {
        _result = result.toInt().toString();
      } else {
        _result = result.toStringAsFixed(2);
      }
    } catch (e) {
      _result = 'Error: Invalid input';
    }

    setState(() {});
  }

  // Clear function
  void _clear() {
    _num1Controller.clear();
    _num2Controller.clear();
    _result = '0';
    _operation = '+';
    setState(() {});
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Calculator title
            const Text(
              'Basic Calculator',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Input section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // First number input
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'First Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                // Operation selector
                DropdownButton<String>(
                  value: _operation,
                  onChanged: (String? newValue) {
                    setState(() {
                      _operation = newValue!;
                    });
                  },
                  items: <String>['+', '-', '×', '÷']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 24),
                          ),
                        );
                      })
                      .toList(),
                ),

                // Second number input
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Second Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Result display
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  const Text(
                    'Result:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _result,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Buttons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Calculate button
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.calculate),
                      SizedBox(width: 10),
                      Text('Calculate', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),

                // Clear button
                ElevatedButton(
                  onPressed: _clear,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.clear),
                      SizedBox(width: 10),
                      Text('Clear', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Instructions
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text(
                    'How to use:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text('1. Enter two numbers'),
                  Text('2. Select operation (+, -, ×, ÷)'),
                  Text('3. Click "Calculate" to see result'),
                  Text('4. Click "Clear" to reset'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
