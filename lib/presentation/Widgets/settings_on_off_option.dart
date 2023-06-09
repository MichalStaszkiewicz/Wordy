
import 'package:flutter/material.dart';



class SettingsOnOffOption extends StatelessWidget {
  SettingsOnOffOption(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.stateOfSwitch});
  String title;
  String subtitle;
  IconData icon;
  bool stateOfSwitch;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        secondary: Icon(icon),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
        value: stateOfSwitch,
        onChanged: (value) {
         
        });
  }
}
