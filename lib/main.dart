import 'package:flutter/material.dart';
import 'package:bmi_calculator/Input_page.dart';
import 'constants.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primcol,
        scaffoldBackgroundColor: scafcol,

      ),
      home: InputPage(),
    );
  }
}

