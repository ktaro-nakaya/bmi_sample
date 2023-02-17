import 'package:bmi_sample/model/bmi.dart';
import 'package:bmi_sample/provider/bmi_state.dart';
import 'package:bmi_sample/repository/bmi_http_clinet.dart';
import 'package:bmi_sample/ui/next.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => InputState();
}

class InputState extends State<InputPage> {
  final TextEditingController _heightController = TextEditingController();
  final _weightController = TextEditingController();
  BMIHttpClientNative client = BMIHttpClientNative();

  @override
  Widget build(BuildContext context) {
    var bmiState = context.watch<BmiState>();
    var bmiList = bmiState.list;
    client.getBmi().then((value) => bmiState.addAll(value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI入力'),
        actions: [
          IconButton(
              onPressed: () {
                client.getBmi().then((value) {
                  bmiState.addAll(value);
                  bmiState.notify();
                });
              },
              icon: const Icon(Icons.local_florist_rounded))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              //　身長
              const Text(
                '身長(cm)：',
                style: TextStyle(fontSize: 20.0),
              ),
              Flexible(
                  child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
              ))
            ],
          ),
          Row(
            children: [
              // 体重
              const Text(
                '体重(kg)：',
                style: TextStyle(fontSize: 20.0),
              ),
              Flexible(
                  child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
              ))
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                    height: _heightController.text,
                                    weight: _weightController.text)));
                        print(
                            "身長：${_heightController.text}cm。体重：${_weightController.text}kg");
                      },
                      child: const Text(
                        '計算',
                        style: TextStyle(fontSize: 20.0),
                      )))),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: bmiList.length,
                      itemBuilder: (context, index) {
                        var bmi = bmiList[index];
                        return Text('体型：${bmi.shape}、BMI：${bmi.bmi}');
                      }))),
          const Spacer(),
        ],
      ),
    );
  }
}
