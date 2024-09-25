import 'package:flutter/material.dart';

import '../consts/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kRoundIconFillColor,
      child: Icon(icon),
    );
  }
}
