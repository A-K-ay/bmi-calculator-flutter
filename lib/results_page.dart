import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'my_widgets.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
   @required this.bmiResult,
   @required this.info,
   @required this.resultText
});

  final String bmiResult;
  final String resultText;
  final String info;


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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: resultsstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(col: activeCardcol,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    resultText.toUpperCase(),
                  style: normalresultStyle,
                ),
                Text(
                  bmiResult,
                  style: bmiresultStyle,
                ),
                Text(
                  info,
                  textAlign: TextAlign.center,
                  style: bodyresultStyle,
                ),

              ],
            ),),
          ),
          BottomButton(
            buttontext: 'RE-CALCULATE',
            function: (){
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}
