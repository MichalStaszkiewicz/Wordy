import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsOnOffOption extends StatelessWidget {
  SettingsOnOffOption(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.callback});
  String title;
  String subtitle;
  IconData icon;
  final Function callback;

  bool stateOfSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        secondary: Icon(icon),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.grey),
        ),
        value: stateOfSwitch,
        onChanged: (value) {
          stateOfSwitch = value;
          callback;
        });
  }
}
