import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../global/global_data_manager.dart';

class FailureToast extends StatefulWidget {
  FailureToast(
      {required this.deviceDimensions,
      required this.choosenAnswer,
      required this.correctAnswer});
  Size deviceDimensions;
  String choosenAnswer;
  String correctAnswer;

  @override
  State<FailureToast> createState() => _FailureToastState();
}

class _FailureToastState extends State<FailureToast>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late Animation _animatePosition;

  @override
  void initState() {
    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
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
        decoration: BoxDecoration(
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
                            child: Icon(
                              Icons.highlight_remove,
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
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ui_lang[locator<GlobalDataManager>()
                                .interfaceLanguage]!['incorrect_answer'],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            maxLines: 1,
                            '${ui_lang[locator<GlobalDataManager>().interfaceLanguage]!['correct_answer']}:  ${widget.correctAnswer}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors.white, letterSpacing: 0.5),
                          )
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
