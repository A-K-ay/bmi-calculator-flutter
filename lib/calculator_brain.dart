import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;
  String bmicalculator() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi > 25) {
      return 'Overweight';
    }
    else if (_bmi > 10.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
  String getInfo(){
    if(_bmi >= 25){
      return 'Stop eating shit and start exercising!';
    }
    else if (_bmi > 10.5) {
      return 'Doing good here!';
    }
    else {
      return 'Is your mama starving you ? No right then start eating more!!';
    }

  }
}