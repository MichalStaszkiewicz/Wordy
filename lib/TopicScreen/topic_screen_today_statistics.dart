import 'package:flutter/material.dart';
class TopicScreenTodayStaticstics extends StatelessWidget {
  TopicScreenTodayStaticstics(
      {required this.icon, required this.label, required this.color});
  IconData icon;
  int label;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 30,
            icon,
            color: color,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            label.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
