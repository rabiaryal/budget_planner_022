import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart'; // Optional, for parsing mathematical expressions

class Calculatortheme extends StatefulWidget {
  const Calculatortheme({super.key});

  @override
  State<Calculatortheme> createState() => _CalculatorthemeState();
}

class _CalculatorthemeState extends State<Calculatortheme> {
  final TextEditingController _controller = TextEditingController();

  void _onButtonPressed(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _calculateResult() {
    try {
      String input = _controller.text;
      // Using function_tree to evaluate the input (optional)
      num result = input.interpret();
      setState(() {
        _controller.text = result.toString();
      });
    } catch (e) {
      setState(() {
        _controller.text = 'Error';
      });
    }
  }

  void _clearInput() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display container
            Container(
              height: 100,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
              ),
              child: TextField(
                controller: _controller,
                readOnly: true,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.right,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20),
            // Calculator buttons
           
           
           
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('/'),
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('*'),
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-'),
                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton('='),
                  _buildButton('+'),
                  _buildButton('C', isClear: true),
                ],
              ),
            ),
          
          
          ],
        ),
      ),
    );
  }

  
  
  
  Widget _buildButton(String value, {bool isClear = false}) {
    return ElevatedButton(
      onPressed: isClear
          ? _clearInput
          : () {
              if (value == '=') {
                _calculateResult();
              } else {
                _onButtonPressed(value);
              }
            },
      child: Text(
        value,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }



}
