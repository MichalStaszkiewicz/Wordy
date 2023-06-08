import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';

import '../../domain/models/interface_language.dart';
import 'confirm_button.dart';
import 'language_tile.dart';

class RegisterCourseList extends StatefulWidget {
  RegisterCourseList(
      {required this.languages,
      required this.onNextStep,
      required this.currentLanguage});
  List<InterfaceLanguage> languages;
  VoidCallBack onNextStep;
  String currentLanguage;

  @override
  State<RegisterCourseList> createState() => _RegisterCourseListState();
}

//TODO implement new logic for course selecting
class _RegisterCourseListState extends State<RegisterCourseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    child: ListView.builder(
                        itemCount: widget.languages.length,
                        itemBuilder: (context, index) => LanguageTile(
                              language: widget.languages[index].name,
                              imagePath: widget.languages[index].image,
                              onSelect: () {
                                context.read<RegisterBloc>().add(
                                    InitialSetupStateUpdate(
                                        languageToLearn:
                                            widget.languages[index].name));
                              },
                              selectedLangauge: widget.currentLanguage,
                            )))),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: widget.onNextStep,
                  child: ConfirmButton(
                    selected: widget.currentLanguage != '' ? true : false,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
