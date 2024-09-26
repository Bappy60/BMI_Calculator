
import 'dart:math';

import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';

import '../components/bmi_button.dart';
import '../components/gender_selector.dart';
import '../components/height_slider.dart';
import '../components/value_adjuster.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var height = 180.0;
  var weight = 60.0;
  var age = 20.0;
  Gender selectedGender = Gender.male;

  void _onGenderSelected(Gender gender) {
    setState(() => selectedGender = gender);
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

  // Function to calculate BMI and navigate to the result page
  void _calculateAndShowResult() {
    final bmi = weight / pow(height / 100, 2); // Calculate BMI
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(bmi: bmi), // Navigate to ResultsPage with BMI
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GenderSelector(
            selectedGender: selectedGender,
            onGenderSelected: _onGenderSelected,
          ),
          HeightSlider(
            height: height,
            onHeightChanged: (newHeight) {
              setState(() => height = newHeight);
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
            onTap: _calculateAndShowResult,
            buttonTitle: "CALCULATE YOUR BMI",
          ),
        ],
      ),
    );
  }
}
