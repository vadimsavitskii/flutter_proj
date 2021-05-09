import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Calculation.dart';

class HistoryPage extends StatefulWidget {

  List<Calculation> listOfCalculations = List<Calculation>();
  HistoryPage({this.listOfCalculations});

  @override
  _HistoryPage createState() => _HistoryPage(listOfCalculations);
}

class _HistoryPage extends State<HistoryPage> {

  List<Calculation> listOfCalculations = List<Calculation>();

  _HistoryPage(this.listOfCalculations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Previous calculations")),
      ),
      body: ListView.builder(
          itemCount: listOfCalculations.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text(
                  'Equation:   ' + listOfCalculations[index].equation +
                  '\n' + 'Timestamp:   ' + listOfCalculations[index].timestamp
              )
            );
          }
      ),
    );
  }
}