import 'dart:convert';

import 'package:bmi_sample/model/bmi.dart';
import 'package:http/http.dart' as http;

class BMIHttpClientNative {

  // json-serverを実行しているIPアドレスを指定
  // json-serverを起動するときは「json-server --host <IPアドレス>」で起動すること
  final String _ipAddress = "XXX.XXX.XXX.XXX";

  Future<List<BMI>> getBmi() async {
    List<BMI> list = [];

    var uri = Uri.parse('http://$_ipAddress:3000/bmi');
    var response = await http.get(uri);
    Iterable iterable = jsonDecode(response.body);
    var conertList = iterable.map((e) => BMI.fromJson(e)).toList();
    list.addAll(conertList);
    return list;
  }

  Future<int> postBmi(BMI bmi) async {
    http.Response? response;

    response = await http.post(
      Uri.parse('http://$_ipAddress:3000/bmi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bmi.toMap()),
    );

    return response.statusCode;
  }
}
