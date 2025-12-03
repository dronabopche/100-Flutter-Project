import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: AddWidget())),
    );
  }
}

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  String ans = '0';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Inputs
        SizedBox(
          width: 200,
          child: TextField(controller: n1, keyboardType: TextInputType.number),
        ),
        Text('+'),
        SizedBox(
          width: 200,
          child: TextField(controller: n2, keyboardType: TextInputType.number),
        ),

        SizedBox(height: 20),

        // Add Button
        ElevatedButton(
          onPressed: () {
            setState(() {
              try {
                double a = double.parse(n1.text);
                double b = double.parse(n2.text);
                ans = (a + b).toString();
              } catch (_) {
                ans = 'Error';
              }
            });
          },
          child: Text('Add'),
        ),

        SizedBox(height: 20),

        // Result
        Text('Result: $ans', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
