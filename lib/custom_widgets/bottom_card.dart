import 'package:bmi_calculator/custom_widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class BottomCard extends StatefulWidget {
  BottomCard({@required this.label, this.score, this.min});
  int score;
  int min;
  final String label;

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: kTextStyle,
        ),
        Text(
          widget.score.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () {
                setState(() {
                  if (widget.score > widget.min) widget.score--;
                });
              },
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: () {
                setState(() {
                  widget.score++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
