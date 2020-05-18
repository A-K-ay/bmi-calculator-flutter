import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconBox extends StatelessWidget {
  RoundIconBox({@required this.icon, @required this.boxcolour,this.onpressed

  });
  final IconData icon;
  final Color boxcolour;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: boxcolour,
        ),
        child:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(icon),
        ) ,
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  GenderCard({@required this.genicon, @required this.gentext});
  final IconData genicon;
  final String gentext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genicon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gentext,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.col, this.cardChild, this.onPress});
  final Color col;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


class BottomButton extends StatelessWidget {
  BottomButton({
    @ required this.buttontext,
    this.function
  });
  final Function function;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 3.0),
        decoration: BoxDecoration(
          color: pinkcol,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
            topLeft: Radius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            buttontext,
            style: largeButtonStyle,

          ),
        ),
      ),
    );
  }
}