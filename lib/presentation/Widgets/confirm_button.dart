import 'package:flutter/material.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../global/global_data_manager.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key, required this.selected});
  final bool selected;

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _textColorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    if (widget.selected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(ConfirmButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 300,
          height: 50,
          margin:
              const EdgeInsets.only(top: 50, bottom: 50, left: 40, right: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.blue),
            color: _colorAnimation.value,
          ),
          child: Center(
            child: Text(
              ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'confirm'],
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: _textColorAnimation.value),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
