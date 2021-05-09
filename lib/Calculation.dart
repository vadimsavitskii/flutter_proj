import 'package:very_simple_calc/database_helper.dart';

class Calculation {
  String equation;
  String timestamp;

  Calculation({this.equation, this.timestamp});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      DatabaseHelper.columnEquation: equation,
      DatabaseHelper.columnTimestamp: timestamp
    };

    return map;
  }

  Calculation.fromMap(Map<String, dynamic> map) {
    equation = map[DatabaseHelper.columnEquation];
    timestamp = map[DatabaseHelper.columnTimestamp];
  }
}

