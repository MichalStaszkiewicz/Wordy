import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/domain/logic/user_data_logic.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/widgets/confirm_button.dart';
import 'package:wordy/presentation/widgets/language_tile.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/widgets/language_to_choose.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../domain/models/language.dart';
import '../../domain/repositiories/repository.dart';
import '../bloc/register/register_bloc.dart';

class RegisterSettingCourse extends StatefulWidget {
  RegisterSettingCourse({required this.onNextStep});

  VoidCallBack onNextStep;
  @override
  State<RegisterSettingCourse> createState() => _RegisterSettingCourseState();
}

class _RegisterSettingCourseState extends State<RegisterSettingCourse> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Language>>(
        future: RepositoryProvider.of<SettingsLogic>(context)
            .getAvailableLanguages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingData();
          } else if (snapshot.data != null && snapshot.hasData) {
            return BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is InitialSetupState) {
                  return Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) =>
                                          LanguageTile(
                                              language:
                                                  snapshot.data![index].name,
                                              imagePath: snapshot
                                                  .data![index].image)))),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: widget.onNextStep,
                                child: ConfirmButton(
                                  selected: state.languageToLearn != ''
                                      ? true
                                      : false,
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }
                if (state is InitialSetupLoading) {
                  return LoadingData();
                } else {
                  return UnexpectedError();
                }
              },
            );
          }
          DialogManager.showErrorDialog(
              "Error occurred when tryed to load data from server",
              "Error",
              context, () {
            context.go('/');
          });
          return Container();
        });
  }
}
