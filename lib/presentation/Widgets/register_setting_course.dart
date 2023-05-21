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
import 'package:wordy/presentation/widgets/register_course_list.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../domain/models/language.dart';
import '../../domain/repositiories/repository.dart';
import '../bloc/register/register_bloc.dart';

class RegisterSettingCourse extends StatefulWidget {
  RegisterSettingCourse();

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
            return Expanded(flex: 8, child: LoadingData());
          } else if (snapshot.data != null && snapshot.hasData) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  DialogManager.showLoadingDialog(
                      'We are preparing app to work for you ! Thank you for patience',
                      'Loading',
                      context);
                } else if (state is InitialSetupDone) {
                  context.go('/home');
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (state is InitialSetupState) {
                    return RegisterCourseList(
                      currentLanguage: state.languageToLearn,
                      languages: snapshot.data!,
                      onNextStep: () {
                        if (state.languageToLearn != '') {
                          context.read<RegisterBloc>().add(FinishInitialSetup(
                              currentCourse: state.languageToLearn));
                        }else{
                           DialogManager.showInformationDialog(
                              'You have to select your language you want to learn',
                              'woops',
                              context);
                        }
                      },
                    );
                  } else if (state is RegisterLanguageChangeInfo) {
                    return RegisterCourseList(
                      currentLanguage: state.languageToLearn,
                      languages: snapshot.data!,
                      onNextStep: () {
                        if (state.languageToLearn != '') {
                          context.read<RegisterBloc>().add(FinishInitialSetup(
                              currentCourse: state.languageToLearn));
                        } else {
                          DialogManager.showInformationDialog(
                              'You have to select your language you want to learn',
                              'woops',
                              context);
                        }
                      },
                    );
                  } else if (state is RegisterError) {
                    return RegisterCourseList(
                      currentLanguage: '',
                      languages: snapshot.data!,
                      onNextStep: () {},
                    );
                  }
                  if (state is InitialSetupLoading) {
                    return Expanded(flex: 8, child: LoadingData());
                  } else {
                    return UnexpectedError();
                  }
                },
              ),
            );
          }
          DialogManager.showErrorDialog(
              "The error occurred when trying to load data from the server.",
              "Error",
              context, () {
            context.go('/');
          });
          return Container();
        });
  }
}
