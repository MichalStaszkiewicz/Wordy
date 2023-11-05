import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/models/user_active_courses_progress.dart';
import 'package:wordy/global/courses_lang_interface.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Widgets/select_interface_language_button.dart';
import 'package:wordy/presentation/bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/presentation/widgets/select_language_list.dart';
import 'package:wordy/presentation/widgets/selected_language_item.dart';
import 'package:wordy/utility/locator/service_locator.dart';
import 'select_language_list_item.dart';

class SelectInterfaceLanguageButton extends StatefulWidget {
  SelectInterfaceLanguageButton({required this.courses});
  UserActiveCoursesProgress courses;

  @override
  State<SelectInterfaceLanguageButton> createState() =>
      _SelectInterfaceLanguageButtonState();
}

class _SelectInterfaceLanguageButtonState
    extends State<SelectInterfaceLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
      builder: (context, state) {
        state as CoursesLoaded;
        var currentInterfaceLanguage =
            state.courses.currentCourse.userCourse.interfaceLanguage;
        return Positioned(
          left: MediaQuery.of(context).size.width / 2,
          top: 0,
          child: Consumer<CoursesLangInterface>(
            builder: (context, model, child) => AnimatedContainer(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: model.isExpanded ? 150 : 50,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  model.setIsExpanded();
                  setState(() {});
                },
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    child: Column(
                      children: [
                        SelectedLangaugeItem(
                          image: currentInterfaceLanguage.image,
                          label: currentInterfaceLanguage.name,
                        ),
                        SelectLanguageList(
                          interfaceLanguages: state.interfaceLanguages,
                          height: constraints.maxHeight,
                          isListExpanded: model.isExpanded,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

