import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/widgets/confirm_button.dart';
import 'package:wordy/presentation/widgets/language_to_choose.dart';
import 'package:wordy/const/consts.dart';

class RegisterSettingCourse extends StatefulWidget {
  RegisterSettingCourse(
      {required this.language,
      required this.onLanguageChoice,
      required this.onNextStep});
  String language;

  VoidCallBack onLanguageChoice;
  VoidCallBack onNextStep;
  @override
  State<RegisterSettingCourse> createState() =>
      _RegisterSettingCourseState();
}

class _RegisterSettingCourseState extends State<RegisterSettingCourse> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    child: ListView.builder(
                        itemCount: languages_available_for_interface.length,
                        itemBuilder: (context, index) => LanguageToChoose(
                              function: widget.onLanguageChoice,
                              index: index,
                              language: widget.language,
                              listLangs: languages_available_for_interface,
                            )))),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: widget.onNextStep,
                  child: ConfirmButton(
                    selected: widget.language != '' ? true : false,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
