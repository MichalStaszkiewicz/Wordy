import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AchievementItemFront extends StatefulWidget {
  AchievementItemFront(
      {required this.image,
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
          Container(height: 50, child: Image(image: AssetImage(widget.image))),
          const SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.center,
            widget.name,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: 130,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                widget.currentProgress != null && widget.maximum != null
                    ? "${widget.currentProgress}/${widget.maximum}"
                    : "",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
