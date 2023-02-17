import 'dart:math';

import 'package:bmi_sample/repository/bmi_http_clinet.dart';

import '../model/bmi.dart';

class BMIService {

  final httpClient = BMIHttpClientNative();

  double clacBmi(String height, String weight) {
    return double.parse(weight) / pow((double.parse(height) / 100), 2);
  }

  String selectShape(double bmi) {
    String shape;
    if (bmi < 18.0) {
      shape = '痩せ型';
    } else if (bmi < 25.0) {
      shape = '通常';
    } else {
      shape = '肥満';
    }
    return shape;
  }

}
