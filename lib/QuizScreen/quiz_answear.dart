import 'package:flutter/material.dart';

class QuizAnswear extends StatelessWidget {
  QuizAnswear({required this.answear});
  String answear;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
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
      child: Center(
        child: Text(
          answear,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
