import 'dart:convert';

import 'package:bmi_sample/model/bmi.dart';
import 'package:bmi_sample/repository/bmi_http_clinet.dart';
import 'package:bmi_sample/service/bmi_service.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String height;
  final String weight;

  const ResultPage({Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bmiService = BMIService();
    var bmi = bmiService.clacBmi(height, weight);
    var shape = bmiService.selectShape(bmi);
    final bmiHttpClient = BMIHttpClientNative();


    return Scaffold(
      appBar: AppBar(title: const Text('計算結果')),
      body: Column(children: [
        const Spacer(),
        Text(
          'BMI:$bmi',
          style: const TextStyle(fontSize: 30),
        ),
        Text('体系：$shape', style: const TextStyle(fontSize: 30)),
        SizedBox(width: double.infinity,
            child: Padding(
              padding:const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    var bmiModel = BMI(bmi, shape);
                    var resultCode = bmiHttpClient.postBmi(bmiModel);
                    resultCode.then((value){
                      print('resultCode:$value');
                      Navigator.of(context).pop();
                    });

                  }, child: const Text('記録')),)),
        const Spacer(),
      ]),
    );
  }
}
