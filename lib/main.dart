import 'package:bmi_calculator/components/bmi_button.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/consts/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/reusable_container.dart';
import 'components/value_adjuster.dart';

enum Gender {
  male,
  female,
}

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
    setState(() {
      selectedGender = gender;
    });
  }

  void _calculateBMI() {
    setState(() {
      _bmi = weight / pow(height / 100, 2);
    });
  }

  String get bmiResult => _bmi.toStringAsFixed(1);

  void incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void decrementWeight() {
    setState(() {
      weight--;
    });
  }

  void incrementAge() {
    setState(() {
      age++;
    });
  }

  void decrementAge() {
    setState(() {
      age--;
    });
  }

  void updateHeight(double newHeight) {
    height = newHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(title: widget.title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGenderSelector(),
          _buildGHeightSlider(),
          _buildWeightSetter(),
          _calculateBmiButton(),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: ReusableContainer(
                onPress: () => _onGenderSelected(Gender.male),
                colour: selectedGender == Gender.male
                    ? kSelectedGenderColor
                    : kInactiveCardColour,
                childWidget: const GenderCard(
                    icon: Icon(
                      Icons.male,
                    ),
                    label: kMaleKey),
              )),
              const SizedBox(width: 16),
              Expanded(
                  child: ReusableContainer(
                onPress: () => _onGenderSelected(Gender.female),
                colour: selectedGender == Gender.female
                    ? kSelectedGenderColor
                    : kInactiveCardColour,
                childWidget: const GenderCard(
                    icon: Icon(
                      Icons.female,
                    ),
                    label: kFemaleKey),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGHeightSlider() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: kInactiveCardColour,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HEIGHT",
                style: kDefaultTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    height.toStringAsFixed(2),
                    style: kDefaultNumberTextStyle
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    "cm",
                    style: kDefaultTextStyle
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: kSliderInactiveTrackColor,
                  activeTrackColor: kSliderActiveTrackColor,
                  thumbColor: kSliderThumbColor,
                  overlayColor: kSliderOverlayColor,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: kSliderMinValue,
                  max: kSliderMaxValue,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightSetter() {
    return Row(
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
    );
  }

  Widget _calculateBmiButton() {
    return BmiButton(
        onTap: _calculateBMI,
        buttonTitle: "CALCULATE YOUR BMI",
    );
  }

  Widget _bmiResult() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: kInactiveCardColour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your BMI",
              style: kDefaultTextStyle,
            ),
            Text(
              _bmi.toStringAsFixed(1),
              style: kDefaultNumberTextStyle,
            ),
          ],
        ),
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
