import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_widgets.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardColor = inactiveCardcol;
  Color femalecardColor = inactiveCardcol;
  BoxShape roundbox = BoxShape.circle;
  var selectedGender;
  int height = 150;
  int weight = 50;
  int age= 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'BMI ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            Text(
              'CALCULATOR',
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    col: selectedGender == Gender.male
                        ? malecardColor = activeCardcol
                        : malecardColor = inactiveCardcol,
                    cardChild: GenderCard(
                      genicon: FontAwesomeIcons.mars,
                      gentext: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      col: selectedGender == Gender.female
                          ? femalecardColor = activeCardcol
                          : femalecardColor = inactiveCardcol,
                      cardChild: GenderCard(
                          genicon: FontAwesomeIcons.venus, gentext: 'Female')),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: activeCardcol,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    width: 100,
                    child: Divider(
                      color: Colors.yellow,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: pinkcol,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          print(newValue);
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    col: activeCardcol,
                    cardChild: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Weight',
                            style: labelTextStyle,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconBox(
                                icon: FontAwesomeIcons.minus,
                                boxcolour: inactiveCardcol,
                                onpressed: () {
                                  setState(() {
                                    weight = weight - 1;
                                    print(weight);
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconBox(
                                icon: FontAwesomeIcons.plus,
                                boxcolour: inactiveCardcol,
                                onpressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                    print(weight);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    col: activeCardcol,
                    cardChild: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Age',
                            style: labelTextStyle,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconBox(
                                icon: FontAwesomeIcons.minus,
                                boxcolour: inactiveCardcol,
                                onpressed: () {
                                  setState(() {
                                    age = age - 1;
                                    print(age);
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconBox(
                                icon: FontAwesomeIcons.plus,
                                boxcolour: inactiveCardcol,
                                onpressed: () {
                                  setState(() {
                                    age = age + 1;
                                    print(age);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              buttontext: 'CALCULATE',
              function: () {

                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.bmicalculator(),
                      info: calc.getInfo(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
