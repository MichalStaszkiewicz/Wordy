import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/register_course_list.dart';
import 'package:wordy/utility/dialog_manager.dart';


import '../../Utility/locator/service_locator.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../../domain/models/interface_language.dart';
import '../../domain/repositiories/repository.dart';
import '../bloc/register/register_bloc.dart';

class RegisterSettingCourse extends StatefulWidget {
  const RegisterSettingCourse({super.key});

  @override
  State<RegisterSettingCourse> createState() => _RegisterSettingCourseState();
}

class _RegisterSettingCourseState extends State<RegisterSettingCourse> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InterfaceLanguage>>(
        future: RepositoryProvider.of<SettingsLogic>(context)
            .getAvailableLanguages()
            .then((value) {
          if (value.isLeft) {
            throw Exception(
                "There was some server issue. Please try again later");
          }
          return value.right!;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Expanded(flex: 8, child: LoadingData());
          } else if (snapshot.data != null && snapshot.hasData) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  DialogManager.showLoadingDialogWithCancelButton(
                      'We are preparing app to work for you ! Thank you for patience',
                      'Loading',
                      context, () {
                    locator.get<Repository>().cancelRequest();
                  });
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
                        } else {
                          DialogManager.showErrorDialog(
                              CustomError(
                                  title: 'Error',
                                  message:
                                      'You have to select a language you want to learn'),
                              context,
                              () {});
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
                    return const Expanded(flex: 8, child: LoadingData());
                  } else {
                    DialogManager.showErrorDialog(
                        ExceptionHelper.getErrorMessage(UnexpectedError()),
                        context, () {
                      context.go('/');
                    });
                    return Container();
                  }
                },
              ),
            );
          }
          DialogManager.showErrorDialog(
              CustomError(
                  title: "Error",
                  message:
                      "The error occurred when trying to load data from the server."),
              context, () {
            context.go('/');
          });
          return Container();
        });
  }
}
