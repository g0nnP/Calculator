import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String userInput = '';
  String answer = '';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                ]
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
              itemCount: buttons.length,
              itemBuilder: (context, i) {

                switch (i) {
                  case 0:
                    return CalculatorButton(
                      onTap: () => setState((){
                        userInput = '';
                        answer = '0';
                      }),
                      buttonText: buttons[i],
                      color: const Color.fromARGB(255, 24, 68, 150),
                      textColor: Colors.white,
                    );
                  case 1:
                    return CalculatorButton(
                      onTap: () => setState(() {
                        userInput += buttons[i];
                      }),
                      buttonText: buttons[i],
                      color: Colors.blue[50]
                    );
                  case 3:
                    return CalculatorButton(
                      onTap: () => setState(() {
                        userInput =
                          userInput.substring(0, userInput.length - 1);
                      }),
                      buttonText: buttons[i],
                      color: const Color.fromARGB(255, 24, 68, 150),
                      textColor: Colors.white,
                    );
                  case 18:
                    return CalculatorButton(
                      onTap: () => setState((){
                        equalPressed();
                      }),
                      buttonText: buttons[i],
                      color: Colors.indigo[700],
                      textColor: Colors.white,
                    );
                  default:
                    return CalculatorButton(
                      onTap: () => setState(() {
                        userInput += buttons[i];
                      }),
                      buttonText: buttons[i],
                      color: isOperator(buttons[i])
                        ? Colors.blueGrey[600]
                        : Colors.blueGrey[200],
                      textColor: isOperator(buttons[i])
                        ? Colors.white
                        : Colors.black,
                    );
                }
              }, 
            )
          )
        ],
      )
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
 
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}