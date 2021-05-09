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
*
*     Database or its entries has to be deleted manually from device/emulator storage.
*/

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_simple_calc/Calculation.dart';
import 'package:very_simple_calc/KmToMilesConverter.dart';

import 'package:intl/intl.dart';

import 'HistoryPage.dart';
import 'database_helper.dart';

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
  bool log = false;
  List<Calculation> listOfCalculations = List<Calculation>();


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
                  height: 15, // used as a padding
                ),
                Row(
                  children: [
                    Container(
                      width: 266,
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
                      width: 13,
                    ),
                    TextButton(
                        child: Text('Logs'),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            primary: Colors.white,
                            minimumSize: Size(80,59)
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryPage(listOfCalculations : listOfCalculations)));
                        }
                    ),
                  ],
                ),
                Container(
                  height: 13, // used as a padding
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
                                minimumSize: Size(173,80)
                            ),
                            onPressed: () async {
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

                                if (currentOperation == '' || firstNumber == '' || secondNumber == '') {
                                  log = false;
                                } else {
                                  log = true;
                                }
                              });

                              String equation = firstNumber + currentOperation + secondNumber + '=' + result;
                              DateTime now = new DateTime.now();
                              String formatDate(DateTime date) => new DateFormat("MMMM d, hh:mm").format(date);
                              String formattedTimeNow = formatDate(now);
                              String nowString = formattedTimeNow.toString();

                              if(log == true) {

                                listOfCalculations.clear();

                                print(' ');

                                await DatabaseHelper.instance.insert({
                                  DatabaseHelper.columnEquation: equation,
                                  DatabaseHelper.columnTimestamp: nowString
                                });

                                List<Map<String,
                                    dynamic>> queryRows = await DatabaseHelper
                                    .instance.queryAll();
                                queryRows.forEach((row) => (print(row)));

                                print(' ');

                                queryRows.forEach((element) {
                                  Calculation calculation = Calculation.fromMap(element);
                                  listOfCalculations.add(calculation);
                                });

                                List<Calculation> listOfCalculationsReversed = listOfCalculations.reversed.toList();
                                listOfCalculations = listOfCalculationsReversed;
                                print(listOfCalculations.length);

                              } else {
                                print('Error. Result not added to database.');
                              }
                            }
                        ),
                        TextButton(
                            child: Text('Km/Mi'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(80,80)
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => KmToMilesConverter()));
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


