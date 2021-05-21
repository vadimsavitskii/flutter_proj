import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_simple_calc/Calculation.dart';
import 'package:very_simple_calc/firestore_api.dart';

import 'database_helper.dart';

class FirestoreHistoryPage extends StatefulWidget {

  List<Calculation> listOfCalculations = List<Calculation>();
  FirestoreHistoryPage({this.listOfCalculations});

  @override
  _FirestoreHistoryPage createState() => _FirestoreHistoryPage(listOfCalculations);
}

class _FirestoreHistoryPage extends State<FirestoreHistoryPage> {

  List<Calculation> listOfCalculations = List<Calculation>();
  _FirestoreHistoryPage(this.listOfCalculations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(25.0),
              child: Text("Firestore records"),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: TextButton(
                  // result of deletion is seen only after revisiting the page
                  onPressed: () async {
                    List<Map<String,
                        dynamic>> queryRows = await DatabaseHelper
                        .instance.queryAll();
                    queryRows.forEach((row) => (print(row)));

                    print(' ');

                    queryRows.forEach((element) {
                      Calculation calculation = Calculation.fromMap(element);
                      listOfCalculations.add(calculation);
                      FirestoreApi().deleteData(calculation.toJson());
                    });
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 26.0,
                  ),
                )
                )
          ],
        ),
        body: Container(
            child: FutureBuilder(
                future: FirestoreApi().getPosts(),
                builder: (_, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0, // to avoid null exception
                      itemBuilder: (_, index) {
                          return Card(
                            child: Text('Equation: ' + snapshot.data[index]
                                .data()['equation'] + '\n' +
                                'Timestamp: ' +
                                snapshot.data[index].data()['timestamp']
                            ),
                          );
                      });
                }
            )
        )
    );
  }
}


