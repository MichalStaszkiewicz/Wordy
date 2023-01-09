import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProgressionBarAnimatedElement extends StatefulWidget {
  ProgressionBarAnimatedElement(
      {super.key, required this.parentWidth, required this.percentage});

  final double percentage;
  final double parentWidth;
  @override
  State<ProgressionBarAnimatedElement> createState() =>
      _ProgressionBarAnimatedElementState();
}

class _ProgressionBarAnimatedElementState
    extends State<ProgressionBarAnimatedElement> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ColorTween _colorTween;
  @override
  void initState() {
    Color beginColor = widget.percentage < 50 ? Colors.red : const Color.fromARGB(255, 0, 255, 8);

    Color endColor = widget.percentage < 50 ? Colors.yellow : const Color.fromARGB(255, 0, 255, 8);
    _colorTween = ColorTween(begin: beginColor, end: endColor);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.value = 1 / widget.parentWidth;
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: _animationController.duration ?? Duration(milliseconds: 1500),
      builder: (context, value, child) {
        return Row(
          children: [
            Container(
              width: value * (widget.parentWidth/1.3) ,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _colorTween.evaluate(
                  AlwaysStoppedAnimation(_animationController.value),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              child: Center(
                child: Text(
                  "${(value * 1000).round() / 10}%",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            )
          ],
        );
      },
      tween: Tween<double>(
          begin: _animationController.value, end: (widget.percentage / 100)),
    );
  }
}
