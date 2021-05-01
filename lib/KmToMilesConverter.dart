import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KmToMilesConverter extends StatefulWidget {
  @override
  _KmToMilesConverterState createState() => _KmToMilesConverterState();
}

class _KmToMilesConverterState extends State<KmToMilesConverter> {
  String currentOperation = '';
  String firstNumber = '';
  String secondNumber = '';
  String firstPlaceHolder = 'km: ';
  String secondPlaceHolder = 'mi: ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kilometers To Miles Converter")),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  child:
                  Column(
                    children: [
                      Container(
                        width: 166,
                        child:
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: firstPlaceHolder + firstNumber,
                            hintStyle: TextStyle(color: Colors.white),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 25,
                            height: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  secondNumber = '';
                                  if (firstPlaceHolder == 'km: ') {
                                    firstPlaceHolder = 'mi: ';
                                    secondPlaceHolder = 'km: ';
                                  } else {
                                    firstPlaceHolder = 'km: ';
                                    secondPlaceHolder = 'mi: ';
                                  }
                                });
                              },
                                child: Icon(Icons.cached),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 166,
                        child:
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: secondPlaceHolder + secondNumber,
                            hintStyle: TextStyle(color: Colors.white),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 400,
                    height: 462,
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.topCenter,
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
                                firstNumber = firstNumber + '1';});
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
                                  firstNumber = firstNumber + '2';});
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
                                  firstNumber = firstNumber + '3';});
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
                                  firstNumber = firstNumber + '4';});
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
                                  firstNumber = firstNumber + '5';});
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
                                  firstNumber = firstNumber + '6';});
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
                                  firstNumber = firstNumber + '7';});
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
                                  firstNumber = firstNumber + '8';});
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
                                  firstNumber = firstNumber + '9';});
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
                                  firstNumber = firstNumber + '0';});
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
                                if(!firstNumber.contains('.') && firstNumber[0] != '.') {
                                  firstNumber = firstNumber + '.';
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
                                firstNumber = '';
                                secondNumber = '';
                              });
                            }
                        ),
                        TextButton(
                            child: Text('Convert'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                primary: Colors.white,
                                minimumSize: Size(266,60)
                            ),
                            onPressed: () {
                              setState(() {
                                if(firstPlaceHolder == 'km: ') {
                                  double miles = double.parse(firstNumber);
                                  miles = miles * 0.621371;
                                  secondNumber = miles.toStringAsFixed(3); // rounding
                                } else if (firstPlaceHolder == 'mi: ') {
                                  double kilometers = double.parse(firstNumber);
                                  kilometers = kilometers * 1.60934;
                                  secondNumber = kilometers.toStringAsFixed(3);
                                }
                              });
                            }
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
