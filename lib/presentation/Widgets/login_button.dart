import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.label, required this.onPressed});
  String label;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 52, 54, 54),
        ),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
