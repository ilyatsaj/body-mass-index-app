import 'package:bmi_calculator/calculator_btain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/custom_widgets/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_widgets/bottom_card.dart';
import 'constants.dart';
import 'custom_widgets/gender_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 100;
  int weight = 80;
  int age = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: kAppBarTextColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderCard(
                        color: selectedGender == Gender.male
                            ? kActiveTextColor
                            : kInactiveTextColor,
                        label: 'Male',
                        icon: FontAwesomeIcons.mars,
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
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderCard(
                        color: selectedGender == Gender.female
                            ? kActiveTextColor
                            : kInactiveTextColor,
                        label: 'Female',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toInt().toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: kTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: kActiveTextColor,
                          thumbColor: kBottomPanelColor, //kBottomPanelColor,
                          inactiveTrackColor: kAppBarColor,
                          thumbShape: null,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 300,
                          onChanged: (newHeight) {
                            setState(() {
                              height = newHeight.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  color: kActiveCardColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: BottomCard(
                        label: 'Weight',
                        score: weight,
                        min: kMinWeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: BottomCard(
                        label: 'Age',
                        score: age,
                        min: kMinAge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculatorBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                              color: calc.getColor(),
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: kAppBarColor),
                  ),
                ),
                color: kBottomPanelColor,
                height: 80.0,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ),
          ],
        ));
  }
}
