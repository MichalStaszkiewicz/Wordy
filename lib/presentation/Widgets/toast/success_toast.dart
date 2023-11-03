import 'package:flutter/material.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../const/consts.dart';
import '../../../global/global_data_manager.dart';

class SuccessToast extends StatefulWidget {
  SuccessToast({super.key, required this.deviceDimensions});
  Size deviceDimensions;

  @override
  State<SuccessToast> createState() => _SuccessToastState();
}

class _SuccessToastState extends State<SuccessToast>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late Animation _animatePosition;

  @override
  void initState() {
    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animatePosition = Tween<double>(
      begin: widget.deviceDimensions.height,
      end: widget.deviceDimensions.height / 1.34,
    ).animate(_positionController)
      ..addListener(() {
        setState(() {});
      });
    _positionController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _positionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _animatePosition.value,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF11998E), Color.fromARGB(255, 28, 199, 94)])),
        height: MediaQuery.of(context).size.height / 4.79,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translate[locator<GlobalDataManager>()
                                .interfaceLanguage]!['correct_answer'],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
