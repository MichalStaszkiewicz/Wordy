import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../global/global_data_manager.dart';

class AchievementItemBack extends StatefulWidget {
  AchievementItemBack(
      {super.key, required this.description, required this.achieved});
  String description;
  bool achieved;

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      widget.achieved
                          ? ui_lang[locator<GlobalDataManager>()
                              .interfaceLanguage]!['achieved']
                          : ui_lang[locator<GlobalDataManager>()
                              .interfaceLanguage]!['locked'],
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: widget.achieved ? Colors.green : Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: AutoSizeText(
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    widget.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
