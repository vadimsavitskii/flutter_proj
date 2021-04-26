/*  My first Dart test application.
*
*   "Bugs":
*       1) operations are not repeated. For example, while pressing Calculate few
*       times, calculator still counts only once, but possible to change operation
*       and get correct result;
*       2) can't delete just one digit, need to press C and start again;
*       3) may put many zeros before dot, but calculator gives correct result,
*       for example, 0000.01 + 0000000000.1 will still give 0.11;
*       4) if not to choose first number and choose any operation and enter
*       second number - program gives error.
*
*     Although, calculator's functionality works in case of correct usage.
*/

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(title: 'Simple Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {

  final String title;
  HomePage({this.title});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentOperation = '';
  String firstNumber = '';
  String secondNumber = '';
  String resultPlaceholder = 'Result:  ';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  child:
                  Wrap(
                    children: [
                      Container(
                        width: 166,
                        child:
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: firstNumber,
                            hintStyle: TextStyle(color: Colors.white),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 50,
                        child: Align(
                            alignment: Alignment.center,
                            child:
                            Text(currentOperation)
                        ),
                      ),
                      Container(
                        width: 166,
                        child:
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: secondNumber,
                            hintStyle: TextStyle(color: Colors.white),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20, // used as a padding
                ),
                Container(
                  width: 400,
                  child:
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: resultPlaceholder + result,
                      hintStyle: TextStyle(color: Colors.white),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20, // used as a padding
                ),
                Container(
                    width: 400,
                    height: 472,
                    child:
                    Wrap(
                      spacing: 13,
                      runSpacing: 13,
                      children: [
                        TextButton(
                            child: Text('1'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '1';
                                } else {
                                  secondNumber = secondNumber + '1';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('2'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '2';
                                } else {
                                  secondNumber = secondNumber + '2';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('3'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '3';
                                } else {
                                  secondNumber = secondNumber + '3';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('+'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '+';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('4'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '4';
                                } else {
                                  secondNumber = secondNumber + '4';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('5'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '5';
                                } else {
                                  secondNumber = secondNumber + '5';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('6'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '6';
                                } else {
                                  secondNumber = secondNumber + '6';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('-'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '-';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('7'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '7';
                                } else {
                                  secondNumber = secondNumber + '7';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('8'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '8';
                                } else {
                                  secondNumber = secondNumber + '8';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('9'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '9';
                                } else {
                                  secondNumber = secondNumber + '9';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('*'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '*';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('0'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '') {
                                  firstNumber = firstNumber + '0';
                                } else {
                                  secondNumber = secondNumber + '0';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('.'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '' && !firstNumber.contains('.') && firstNumber[0] != '.') {
                                  firstNumber = firstNumber + '.';
                                }
                                if(currentOperation != '' && !secondNumber.contains('.') && secondNumber[0] != '.') {
                                  secondNumber = secondNumber + '.';
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('C'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '';
                                firstNumber = '';
                                secondNumber = '';
                                result = '';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('/'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '/';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('Calculate'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(266,80)
                            ),
                            onPressed: () {
                              setState(() {
                                if(currentOperation == '^') {
                                  double base = double.parse(firstNumber);
                                  double exponent = double.parse(secondNumber);
                                  double powerResult = pow(base, exponent);
                                  result = powerResult.toString();
                                } else if (currentOperation == '+') {
                                  double firstNumberParsed = double.parse(firstNumber);
                                  double secondNumberParsed = double.parse(secondNumber);
                                  double additionResult = firstNumberParsed + secondNumberParsed;
                                  result = additionResult.toString();
                                } else if (currentOperation == '-') {
                                  double firstNumberParsed = double.parse(firstNumber);
                                  double secondNumberParsed = double.parse(secondNumber);
                                  double subtractionResult = firstNumberParsed - secondNumberParsed;
                                  result = subtractionResult.toString();
                                } else if (currentOperation == '*') {
                                  double firstNumberParsed = double.parse(firstNumber);
                                  double secondNumberParsed = double.parse(secondNumber);
                                  double multiplicationResult = firstNumberParsed * secondNumberParsed;
                                  result = multiplicationResult.toString();
                                } else if (currentOperation == '/') {
                                  double firstNumberParsed = double.parse(firstNumber);
                                  double secondNumberParsed = double.parse(secondNumber);
                                  double divisionResult = firstNumberParsed / secondNumberParsed;
                                  result = divisionResult.toString();
                                }
                              });
                            }
                        ),
                        TextButton(
                            child: Text('^'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              setState(() {
                                currentOperation = '^';
                              });
                            }
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


