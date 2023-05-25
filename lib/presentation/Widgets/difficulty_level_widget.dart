import 'package:flutter/material.dart';

class DifficultyLevelWidget extends StatelessWidget {
  DifficultyLevelWidget({required this.textColor, required this.widgetColor});
  Color widgetColor;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widgetColor, borderRadius: BorderRadius.circular(20)),
      height: 25,
      width: 100,
      child: Center(
        child: Text(
          "Advanced",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
