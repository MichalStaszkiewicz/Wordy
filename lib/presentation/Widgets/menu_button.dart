import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({required this.label,required this.function});
  String label;
  Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){function();},
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
