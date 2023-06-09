import 'package:flutter/material.dart';

class HeaderInProfile extends StatelessWidget {
  HeaderInProfile({super.key, required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold, ),
      ),
    );
  }
}
