import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Kalkulator(),
    );
  }
}

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String _input = "";
  String _Output ="";
  
  void handleButtonPress(String value){
    setState(() {
      if (value == 'C'){
        _input = "";
        _Output = "";

      }else if (value == '='){
        calculateResult();
      }else if (value == '<='){
        if (_input.isNotEmpty){
          _input = _input.substring(0, _input.length - 1);
        }
      }else {
        _input += value;
      }
    });
  }

  void calculateResult(){
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_input);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      _Output = eval.toString();
    }catch (e){
      _Output = 'Erorr';
    }
  }
  Widget buildButton(String text){
    return Expanded(
      child: OutlinedButton(
        onPressed:() => handleButtonPress(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana dan Mudah'),
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _input,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _Output,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('4'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('5'),
              buildButton('6'),
              buildButton('7'),
              buildButton('8'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('9'),
              buildButton('0'),
              buildButton('+'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('/'),
              buildButton('-'),
              buildButton('.'),
              buildButton('%'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('='),
              buildButton('+'),
              buildButton('<='),
            ],
          )
        ],
      ),
    );
  }
}