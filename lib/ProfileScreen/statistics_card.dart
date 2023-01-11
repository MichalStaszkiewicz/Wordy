import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  StatisticsCard(
      {required this.image,
      required this.label,
      required this.max,
      required this.current});
  String image;
  String label;
  int max;
  int current;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                child: Center(
                    child: Text(
                  label,
                  style: Theme.of(context).textTheme.subtitle1,
                )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: Text(
                  "$current/$max",
                  style: Theme.of(context).textTheme.subtitle1,
                )),
              ))
        ],
      ),
    );
  }
}
