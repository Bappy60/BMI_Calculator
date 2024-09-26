import 'package:flutter/widgets.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {super.key, required this.colour, this.childWidget, this.onPress});

  final Color colour;
  final Widget? childWidget;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: childWidget,
      ),
    );
  }
}
