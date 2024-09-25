import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts/constants.dart';

class ValueAdjuster extends StatelessWidget {
  final String title;
  final double value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValueAdjuster({
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: kInactiveCardColour,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kDefaultTextStyle
              ),
              Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 35.0,
                  color: kDefaultNumberColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: onDecrement,
                  ),
                  const SizedBox(width: 10),
                  RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                    onPressed: onIncrement,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
