import 'package:flutter/material.dart';

import 'difficulty_level_widget.dart';

class DailyChallangeWidget extends StatelessWidget {
  DailyChallangeWidget({required this.difficultyLevel});
  String difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: 300,
      width: 370,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 222, 207, 247),
            offset: Offset(0, 5),
            blurRadius: 9.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.centerRight,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image(image: AssetImage('assets/dailychallange.png'))),
          Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DifficultyLevelWidget(
                  textColor: Colors.blue,
                  widgetColor: Colors.blue.withOpacity(0.3),
                  label: difficultyLevel,
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      child: Text(
                        'Today\'s challange',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        textAlign: TextAlign.start,
                        'German meals',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.blue[600],
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.diamond_outlined,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            'Take this lesson to earn a new milestone',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.black38),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
