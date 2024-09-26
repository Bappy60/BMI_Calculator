import 'package:bmi_calculator/components/bmi_button.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import 'package:bmi_calculator/consts/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/height_slider.dart';
import 'components/value_adjuster.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var height = 180.0;
  var weight = 60.0;
  var age = 20.0;
  double _bmi = 0.0;
  Gender selectedGender = Gender.male;

  void _onGenderSelected(Gender gender) {
    setState(() => selectedGender = gender);
  }

  void _calculateBMI() {
    setState(()=> _bmi = weight / pow(height / 100, 2));
    print(_bmi);
  }

  void incrementWeight() {
    setState(() => weight++);
  }

  void decrementWeight() {
    setState(() => weight--);
  }

  void incrementAge() {
    setState(() => age++);
  }

  void decrementAge() {
    setState(() => age--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(title: widget.title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GenderSelector(
              selectedGender: selectedGender ,
              onGenderSelected: _onGenderSelected,
          ),
          HeightSlider(
            height: height,
            onHeightChanged: (newHeight) {
              setState(() =>  height = newHeight);
            },
          ),
          Row(
            children: [
              ValueAdjuster(
                title: "WEIGHT",
                value: weight,
                onIncrement: incrementWeight,
                onDecrement: decrementWeight,
              ),
              ValueAdjuster(
                title: "AGE",
                value: age,
                onIncrement: incrementAge,
                onDecrement: decrementAge,
              ),
            ],
          ),
          BmiButton(
            onTap: _calculateBMI,
            buttonTitle: "CALCULATE YOUR BMI",
          ),
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const _MyAppBar({
    required String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
    );
  }

  @override
  Size get preferredSize => const Size.square(30);
}