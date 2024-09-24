import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

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
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
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

  void _onPressSelected() {
    print("Selected");
  }

  void _onPressPlus() {
    setState(() {
      weight++;
    });
  }

  void _onPressMinus() {
    setState(() {
      weight--;
    });
  }

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
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
                child: GestureDetector(
                  onTap: _onPressSelected,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF111328),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.male,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: _onPressSelected,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF111328),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.female,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGHeightSlider() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 330,
        decoration: BoxDecoration(
          color: const Color(0xFF111328),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "HEIGHT",
              style: TextStyle(
                fontSize: 25.0,
                color: Color(0xFF8D8E98),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 35.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(width: 2),
                const Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: const Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
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
    );
  }

  Widget _buildWeightSetter() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111328),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "WEIGHT",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Text(
                    weight.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        elevation: 0.0,
                        onPressed: _onPressMinus,
                        constraints: const BoxConstraints.tightFor(
                          width: 45.0,
                          height: 45.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                        child: const Icon(FontAwesomeIcons.minus),
                      ),
                      const SizedBox(width: 10),
                      RawMaterialButton(
                        elevation: 0.0,
                        onPressed: _onPressPlus,
                        constraints: const BoxConstraints.tightFor(
                          width: 45.0,
                          height: 45.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                        child: const Icon(FontAwesomeIcons.plus),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111328),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "AGE",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Text(
                    age.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        elevation: 0.0,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        constraints: const BoxConstraints.tightFor(
                          width: 45.0,
                          height: 45.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                        child: const Icon(FontAwesomeIcons.minus),
                      ),
                      const SizedBox(width: 10),
                      RawMaterialButton(
                        elevation: 0.0,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        constraints: const BoxConstraints.tightFor(
                          width: 45.0,
                          height: 45.0,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF4C4F5E),
                        child: const Icon(FontAwesomeIcons.plus),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _calculateBmiButton() {
    return GestureDetector(
      onTap: calculateBMI,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
        child: const Center(
          child: Text(
            "Calculate Your BMI",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
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
