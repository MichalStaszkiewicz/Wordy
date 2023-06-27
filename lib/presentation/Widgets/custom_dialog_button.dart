import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  CustomDialogButton({super.key, required this.label, required this.colors});
  String label;
  List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // przesunięcie cienia w poziomie i pionie
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
