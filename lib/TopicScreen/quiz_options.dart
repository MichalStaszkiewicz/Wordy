import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class QuizOptions extends StatelessWidget {
  final String topicName;

  QuizOptions({required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 200,
      width: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(topicName, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.book),
                onPressed: () {
                  // code to execute on press of the first button
                },
              ),
              IconButton(
                icon: Icon(Icons.note),
                onPressed: () {
                  // code to execute on press of the second button
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
