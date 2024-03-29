import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:get/get.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/course.dart';
import '../../global/global_data_manager.dart';

import 'button/confirm_button.dart';
import 'language_tile.dart';

class RegisterCourseList extends StatefulWidget {
  RegisterCourseList(
      {super.key,
      required this.languages,
      required this.onNextStep,
      required this.currentLanguage});
  List<Course> languages;
  VoidCallBack onNextStep;
  String currentLanguage;

  @override
  State<RegisterCourseList> createState() => _RegisterCourseListState();
}

class _RegisterCourseListState extends State<RegisterCourseList> {
  @override
  Widget build(BuildContext context) {
   
for(Course course in widget.languages){

 print(course.name);

}
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
                        itemBuilder: (context, index) {
                         
                          
                          return LanguageTile(
                            language: translate['english']![
                                widget.languages[index].name.toLowerCase()],
                            imagePath: widget.languages[index].image,
                            onSelect: () {
                              context.read<RegisterBloc>().add(
                                  InitialSetupStateUpdate(
                                      updatedLanguage:
                                          widget.languages[index].name,
                                      beforeUpdateLanguage:
                                          widget.currentLanguage));
                            },
                            selectedLangauge: widget.currentLanguage,
                          );
                        }))),
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
