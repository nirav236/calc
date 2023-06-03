import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = '0';
  String result = '0';
  // double num1 = 0;
  // double num2 = 0;
  String expression = "";

  void buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      equation = '0';
      result = '0';
      expression = '';
    } else if (buttonText == '=') {
      expression = equation;

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = "${exp.evaluate(EvaluationType.REAL, cm)}";
      } catch (e) {
        result = 'Error';
      }
    } else {
      if (equation == '0') {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }
    print(equation);
    print(result);

    setState(() {});
  }
  //void buttonPressed(String buttonText) {
  //   if (buttonText == 'CLEAR') {
  //     _output = '0';
  //     num1 = 0;
  //     num2 = 0;
  //     operand = '';
  //   } else if (buttonText == '+' ||
  //       buttonText == '-' ||
  //       buttonText == '/' ||
  //       buttonText == '*') {
  //     //  num1 = double.parse(output);
  //     num1 = double.parse(output);
  //     operand = buttonText;
  //     _output = '0';
  //   } else if (buttonText == '.') {
  //     if (!_output.contains('.')) {
  //       _output += buttonText;
  //     }
  //   } else if (buttonText == '=') {
  //     num2 = double.parse(output);
  //     if (operand == '+') {
  //       _output = (num1 + num2).toString();
  //     } else if (operand == '-') {
  //       _output = (num1 - num2).toString();
  //     } else if (operand == '*') {
  //       _output = (num1 * num2).toString();
  //     } else if (operand == '/') {
  //       if (num2 != 0) {
  //         _output = (num1 / num2).toString();
  //       } else {
  //         _output = 'Error';
  //       }
  //     }
  //     num1 = 0;
  //     num2 = 0;
  //     operand = '';
  //   } else {
  //     _output = _output + buttonText;
  //   }

  //   print(_output);
  //   setState(() {
  //     output = double.parse(_output).toStringAsFixed(1);
  //   });
  // }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Column(
                children: [
                  Text(
                    equation,
                    //'$num1 $operand $num2 = $output',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result,
                    //'$num1 $operand $num2 = $output',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Divider()),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                new Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*'),
                  ],
                ),
                new Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                new Row(
                  children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ],
                ),
                new Row(
                  children: [
                    buildButton('CLEAR'),
                    buildButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Calculator',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage();

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String output = '0';
//   String _output = '0';
//   double num1 = 0;
//   double num2 = 0;
//   String operand = "";

//   void buttonPressed(String buttonText) {
//     if (buttonText == 'CLEAR') {
//       _output = '0';
//       num1 = 0;
//       num2 = 0;
//       operand = '';
//     } else if (buttonText == '+' ||
//         buttonText == '-' ||
//         buttonText == '/' ||
//         buttonText == '*') {
//       //  num1 = double.parse(output);
//       num1 = double.parse(output);
//       operand = buttonText;
//       _output = '0';
//     } else if (buttonText == '.') {
//       if (!_output.contains('.')) {
//         _output += buttonText;
//       }
//     } else if (buttonText == '=') {
//       num2 = double.parse(output);
//       if (operand == '+') {
//         _output = (num1 + num2).toString();
//       } else if (operand == '-') {
//         _output = (num1 - num2).toString();
//       } else if (operand == '*') {
//         _output = (num1 * num2).toString();
//       } else if (operand == '/') {
//         if (num2 != 0) {
//           _output = (num1 / num2).toString();
//         } else {
//           _output = 'Error';
//         }
//       }
//       num1 = 0;
//       num2 = 0;
//       operand = '';
//     } else {
//       _output = _output + buttonText;
//     }

//     print(_output);
//     setState(() {
//       output = double.parse(_output).toStringAsFixed(1);
//     });
//   }

//   Widget buildButton(String buttonText) {
//     return Expanded(
//       child: SizedBox(
//         height: 70,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: OutlinedButton(
//             child: Text(
//               buttonText,
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () => buttonPressed(buttonText),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calculator'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.centerRight,
//               padding:
//                   const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//               child: Column(
//                 children: [
//                   Text(
//                     output,
//                     //'$num1 $operand $num2 = $output',
//                     style: const TextStyle(
//                       fontSize: 48,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(child: Divider()),
//             new Column(
//               children: [
//                 new Row(
//                   children: [
//                     buildButton('7'),
//                     buildButton('8'),
//                     buildButton('9'),
//                     buildButton('/'),
//                   ],
//                 ),
//                 new Row(
//                   children: [
//                     buildButton('4'),
//                     buildButton('5'),
//                     buildButton('6'),
//                     buildButton('*'),
//                   ],
//                 ),
//                 new Row(
//                   children: [
//                     buildButton('1'),
//                     buildButton('2'),
//                     buildButton('3'),
//                     buildButton('-'),
//                   ],
//                 ),
//                 new Row(
//                   children: [
//                     buildButton('.'),
//                     buildButton('0'),
//                     buildButton('00'),
//                     buildButton('+'),
//                   ],
//                 ),
//                 new Row(
//                   children: [
//                     buildButton('CLEAR'),
//                     buildButton('='),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
