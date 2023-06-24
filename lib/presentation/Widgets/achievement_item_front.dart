import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

class AchievementItemFront extends StatefulWidget {
  AchievementItemFront(
      {super.key,
      required this.image,
      required this.name,
      required this.currentProgress,
      required this.maximum});
  String image;
  String name;
  int? currentProgress;
  int? maximum;

  @override
  State<AchievementItemFront> createState() => _AchievementItemFrontState();
}

class _AchievementItemFrontState extends State<AchievementItemFront> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50, child: Image(image: AssetImage(widget.image))),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AutoSizeText(
              maxLines: 1,
              textAlign: TextAlign.center,
              widget.name,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 130,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: AutoSizeText(
                maxLines: 2,
                "${widget.currentProgress}/${widget.maximum}",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ProgressionBar(
            height: 10,
            gradient: const [
              Color.fromARGB(255, 99, 155, 252),
              Color.fromRGBO(158, 149, 248, 1),
            ],
            nonProgressionColor: const Color.fromARGB(255, 231, 227, 227),
            progress: (widget.currentProgress! / widget.maximum!) * 100,
            width: 150,
          )
        ],
      ),
    );
  }
}
