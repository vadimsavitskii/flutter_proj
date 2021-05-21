import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_simple_calc/FirestoreHistoryPage.dart';

import 'Calculation.dart';
import 'HistoryPage.dart';


class TypesOfHistoryChoicePage extends StatefulWidget {

  List<Calculation> listOfCalculations = List<Calculation>();
  TypesOfHistoryChoicePage({this.listOfCalculations});

  @override
  _TypesOfHistoryChoicePage createState() => _TypesOfHistoryChoicePage(listOfCalculations);
}

class _TypesOfHistoryChoicePage extends State<TypesOfHistoryChoicePage> {

  List<Calculation> listOfCalculations = List<Calculation>();

  _TypesOfHistoryChoicePage(this.listOfCalculations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Text("Choose storage"),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                   child: Text('SQL Storage'),
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      primary: Colors.white,
                      minimumSize: Size(173,65)
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryPage(listOfCalculations : listOfCalculations)));
                      },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  child: Text('Firestore'),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      primary: Colors.white,
                      minimumSize: Size(173,65)
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirestoreHistoryPage(listOfCalculations : listOfCalculations)));
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}