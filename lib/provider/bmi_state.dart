import 'package:bmi_sample/model/bmi.dart';
import 'package:flutter/material.dart';

class BmiState extends ChangeNotifier {
  final List<BMI> list = [];

  add(BMI bmi) {
    list.add(bmi);
  }

  addAll(List<BMI> list) {
    this.list.clear();
    this.list.addAll(list);
  }

  notify() {
    super.notifyListeners();
  }
}
