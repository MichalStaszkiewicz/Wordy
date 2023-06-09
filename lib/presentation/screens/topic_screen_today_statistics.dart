import 'package:flutter/material.dart';
class TopicScreenTodayStaticstics extends StatelessWidget {
  TopicScreenTodayStaticstics(
      {super.key, required this.label, required this.image});
String image;
  int label;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: Image(
              image: AssetImage(image),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
