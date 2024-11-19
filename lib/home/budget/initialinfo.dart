import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class InitialInfoPage extends StatefulWidget {
  const InitialInfoPage({super.key});

  @override
  State<InitialInfoPage> createState() => _InitialInfoPageState();
}

class _InitialInfoPageState extends State<InitialInfoPage> {
  final TextEditingController _controller = TextEditingController();
  void _onButtonPressed(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _calculateResult() {
    try {
      String input = _controller.text;
      num result = input.interpret(); // Use `num` type
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

  Widget typesofbudget(String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Center(child: Text(title)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              typesofbudget('Income'),
              typesofbudget('Expensse'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
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
          const SizedBox(height: 150),
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
               
                _buildButton('C', isClear: true),

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
              ],
            ),
          ),
        ],
      ),
    )));
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
