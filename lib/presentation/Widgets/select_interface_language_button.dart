import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/models/user_active_courses_progress.dart';
import 'package:wordy/global/courses_lang_interface.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import 'select_language_list.dart';

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
        return ChangeNotifierProvider(
          create: (context) => CoursesLangInterface(),
          child: Positioned(
            left: MediaQuery.of(context).size.width / 2,
            top: 0,
            child: Consumer<CoursesLangInterface>(
              builder: (context, model, child) => AnimatedContainer(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
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
          ),
        );
      },
    );
  }
}

class SelectedLangaugeItem extends StatefulWidget {
  SelectedLangaugeItem({
    super.key,
    required this.image,
    required this.label,
  });

  String image;
  String label;

  @override
  State<SelectedLangaugeItem> createState() => _SelectedLangaugeItemState();
}

class _SelectedLangaugeItemState extends State<SelectedLangaugeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 35,
            child: Image.network(Urls.kImageUrl + widget.image),
          ),
          Text(
              translate[locator<GlobalDataManager>().interfaceLanguage]![
                  widget.label],
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
          Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              child: const Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.black))
        ],
      ),
    );
  }
}
