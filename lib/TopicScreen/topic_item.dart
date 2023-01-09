import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:wordy/TopicScreen/topic_item_back.dart';
import 'package:wordy/TopicScreen/topic_item_front.dart';

class TopicItem extends StatefulWidget {
  TopicItem({required this.image, required this.label,required this.color});
  String label;
  String image;
  Color color;

  @override
  State<TopicItem> createState() => _TopicItemState();
}

class _TopicItemState extends State<TopicItem> with TickerProviderStateMixin {
  @override
  late AnimationController _controller;
  late Tween<double> _tween;
  double angle = 0 * -pi;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _tween = Tween<double>(
      begin: 0,
      end: 1,
    )..animate(_controller).addListener(() {
        setState(() {
          angle = _controller.value * -pi;
        });
      });
    super.initState();
  }

  Widget cardState() {
    if(_controller.value<0.5){

      return  TopicItemFront(
      color:widget.color,
          image: widget.image,
          label: widget.label,
        );
    }else{
      return TopicItemBack();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.forward();
        });
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle),
        child: cardState()
      ),
    );
  }
}
