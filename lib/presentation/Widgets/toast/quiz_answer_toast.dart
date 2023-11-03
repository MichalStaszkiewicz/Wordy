import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../const/consts.dart';
import '../../../global/global_data_manager.dart';

class QuizAnswerToast extends StatefulWidget {
  QuizAnswerToast(
      {super.key,
      required this.deviceDimensions,
      required this.choosenAnswer,
      required this.correctAnswer,
      required this.correct});
  Size deviceDimensions;
  String choosenAnswer;
  String correctAnswer;
  bool correct;

  @override
  State<QuizAnswerToast> createState() => _QuizAnswerToastState();
}

class _QuizAnswerToastState extends State<QuizAnswerToast>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late Animation _animatePosition;
  var title = '';
  var message = '';
  late IconData icon;
  late Color iconColor;
  late Color iconBgColor;

  @override
  void initState() {
    if (widget.correct) {
      title = translate[locator<GlobalDataManager>().interfaceLanguage]![
          'correct_answer'];
      icon = Icons.check;
      iconColor = Colors.green;
      iconBgColor = Colors.green.shade200;
    } else {
      title = translate[locator<GlobalDataManager>().interfaceLanguage]![
          'incorrect_answer'];
      message = translate[locator<GlobalDataManager>().interfaceLanguage]
              ?['correct_answer'] +
          " : " +
          widget.correctAnswer;
      icon = Icons.close;
      iconColor = Colors.red;
      iconBgColor = Colors.red.shade200;
    }
    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animatePosition = Tween<double>(
      begin: widget.deviceDimensions.height,
      end: widget.deviceDimensions.height / 1.40,
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
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0x817d7d).withOpacity(1),
                offset: const Offset(0, 0),
                blurRadius: 25,
                spreadRadius: -10,
              )
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        height: MediaQuery.of(context).size.height / 3.8,
        width: MediaQuery.of(context).size.width,
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: iconBgColor),
                        child: Icon(
                          size: 15,
                          icon,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Container(
                    
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.black),
                          ),
                          widget.correct == false
                              ? const SizedBox(
                                  height: 10,
                                )
                              : Container(),
                          widget.correct == false
                              ? AutoSizeText(
                                  message,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.black,
                                          letterSpacing: 0.5),
                                )
                              : Container()
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
