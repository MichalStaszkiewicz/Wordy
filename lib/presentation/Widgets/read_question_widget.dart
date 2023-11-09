
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReadQuestionWidget extends StatelessWidget {
  const ReadQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     

    
      height: 30,
      alignment: Alignment.centerRight,
      child: FaIcon(
        FontAwesomeIcons.volumeHigh,
        size: 15,
        color: Colors.blueAccent,
      ),
    );
  }
}
