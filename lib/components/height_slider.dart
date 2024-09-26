import 'package:flutter/material.dart';
import '../consts/constants.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
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
              const Text("HEIGHT", style: kDefaultTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(height.toStringAsFixed(2),
                      style: kDefaultNumberTextStyle),
                  const SizedBox(width: 2),
                  const Text("cm", style: kDefaultTextStyle),
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
                  onChanged: onHeightChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
