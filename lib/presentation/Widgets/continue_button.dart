import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../const/consts.dart';
import '../../global/global_data_manager.dart';

class ContinueButton extends StatefulWidget {
  const ContinueButton({super.key});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.selectedCourse, extra: {'quizType': 'Learning'});
      },
      child: Container(
        width: 130,
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade700],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                      'continue'],
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
