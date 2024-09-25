import 'package:flutter/cupertino.dart';

import '../consts/constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.icon,
    required this.label,
  });

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon.icon,
          size: 120.0,
          color: kGenderIconColor,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kGenderLabelTextStyle,
        )
      ],
    );
  }
}
