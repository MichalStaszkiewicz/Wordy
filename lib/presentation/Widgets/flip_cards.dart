import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class FlipCards extends StatefulWidget {
  FlipCards({required this.front, required this.back});

  Widget front;
  Widget back;

  @override
  State<FlipCards> createState() => _FlipCardsState();
}

class _FlipCardsState extends State<FlipCards> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isFront(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;
    return angle <= degrees90 || angle >= degrees270;
  }

  bool isflipped = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angle = controller.value * -pi;
        final transform = Matrix4.identity()..rotateY(angle.abs());

        return GestureDetector(
          onTap: () {
            if (isflipped == false) {
              isflipped = true;
              controller.forward();
            } else {
              isflipped = false;
              controller.reverse();
      
            }
          },
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: isFront(angle.abs())
                ? widget.front
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.back,
                  ),
          ),
        );
      },
    );
  }
}
