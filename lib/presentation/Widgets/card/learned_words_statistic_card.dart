import 'package:flutter/material.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import '../../../const/urls.dart';

class LearnedWordsStatisticCard extends StatefulWidget {
  LearnedWordsStatisticCard(
      {super.key, required this.maximum, required this.current, required this.image});
  int maximum;
  int current;
  String image;

  @override
  State<LearnedWordsStatisticCard> createState() =>
      _LearnedWordsStatisticCardState();
}

class _LearnedWordsStatisticCardState extends State<LearnedWordsStatisticCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(locator<Urls>().imageUrl + widget.image)),
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50)),
          ),
          ProgressionBar(
            progress: (widget.current / widget.maximum) * 100,
            width: 230,
            gradient: const [
              Color.fromARGB(255, 99, 155, 252),
              Color.fromRGBO(158, 149, 248, 1),
            ],
            nonProgressionColor: Color.fromARGB(255, 235, 232, 232),
            height: 10,
          ),
          Text(
            "${widget.current} / ${widget.maximum}",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(),
          )
        ],
      ),
    );
  }
}
