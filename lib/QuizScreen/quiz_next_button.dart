import 'package:flutter/material.dart';
class QuizNextButton extends StatelessWidget {
  const QuizNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.blueAccent,
      child: Center(child: Text("Next",style: Theme.of(context).textTheme.headline5!.copyWith(letterSpacing: 1),),),
    );
  }
}
