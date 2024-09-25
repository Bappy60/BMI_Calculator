import 'package:flutter/material.dart';
import '../consts/constants.dart';
import 'gender_card.dart';
import 'reusable_container.dart';

enum Gender { male, female }

class GenderSelector extends StatelessWidget {
  final Gender selectedGender;
  final Function(Gender) onGenderSelected;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ReusableContainer(
              onPress: () => onGenderSelected(Gender.male),
              colour: selectedGender == Gender.male
                  ? kSelectedGenderColor
                  : kInactiveCardColour,
              childWidget: const GenderCard(
                  icon: Icon(
                    Icons.male,
                  ),
                  label: kMaleKey),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ReusableContainer(
              onPress: () => onGenderSelected(Gender.female),
              colour: selectedGender == Gender.female
                  ? kSelectedGenderColor
                  : kInactiveCardColour,
              childWidget: const GenderCard(
                  icon: Icon(
                    Icons.female,
                  ),
                  label: kFemaleKey),
            ),
          ),
        ],
      ),
    );
  }
}
