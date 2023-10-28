import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onPress;
  final double scaleValue;

  const BouncingWidget({super.key, required this.child, required this.onPress,this.scaleValue = 0.95});

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 45),
    );
    _scale = Tween<double>(begin: 1.0, end: widget.scaleValue)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        if (widget.onPress == null) return;
        widget.onPress();
      },
      child: ScaleTransition(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
