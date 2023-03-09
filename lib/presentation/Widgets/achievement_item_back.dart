import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AchievementItemBack extends StatefulWidget {
  AchievementItemBack({required this.description});
  String description;

  @override
  State<AchievementItemBack> createState() => _AchievementItemBackState();
}

class _AchievementItemBackState extends State<AchievementItemBack> {
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
      child: Center(child: Text(textAlign:TextAlign.center,widget.description,style: Theme.of(context).textTheme.titleSmall,),)
    );
  }
}
