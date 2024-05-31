import 'dart:math';

import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  double result = 0.0;
  final double height;
  final int weight;

  BMIResultScreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0D22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1.0,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1d1e33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getResult(),
                      style: const TextStyle(
                        color: Color(0xFFE83D66),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      calculateBMI().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      getInterpretation(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 70.0,
            color: const Color(0xffeb1554),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'RE-CALCULATE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateBMI() {
    result = weight / pow(height / 100, 2);
    return result.round().toDouble();
  }

  String getResult() {
    if (result >= 25) {
      return 'Over Weight';
    } else if (result > 18.5) {
      return 'Normal';
    } else {
      return 'Under Wight';
    }
  }

  String getInterpretation() {
    if (result >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (result > 18.5) {
      return 'You have a normal body weight. Good Job.';
    } else {
      return 'You have a lower than normal body wight. You can eat a bit more.';
    }
  }
}
