import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          brightness: Brightness.light,
          hoverColor: Colors.yellow,
          primaryColor: kAppBarColor,
          scaffoldBackgroundColor: kBackgroundColor),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/resultPage': (context) => ResultPage(),
      },
    );
  }
}
//0xFF405F4B
