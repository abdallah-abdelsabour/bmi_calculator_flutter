import 'package:bmi_calculator_flutter/consts.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final result;
  final bmi;
  final interpreation;

  ResultPage({this.bmi, this.result, this.interpreation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "your result",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: activeColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    bmi,
                    style: numberStyle,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      interpreation,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEC4556),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child: Center(
                  child: Text(
                "Re CALCULATE",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              )),
              width: double.infinity,
              height: 60,
              
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
