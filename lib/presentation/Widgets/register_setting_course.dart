import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/register_course_list.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
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
          if (value.isError) {
            throw Exception(
                "There was some server issue. Please try again later");
          }
          return value.data!;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Expanded(flex: 8, child: LoadingData());
          } else if (snapshot.data != null && snapshot.hasData) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    DialogManager.showLoadingDialogWithCancelButton(
                        'We are preparing app to work for you ! Thank you for patience',
                        'Loading',
                        context, () {
                      locator.get<Repository>().cancelRequest();
                      context.go(AppRouter.authScreen);
                    });
                  });
                }

                if (state is InitialSetupState) {
                  if (state.languageConflict) {
                    DialogManager.showQuestionDialog(
                        "This action will change your interface language. Do you want to continue?",
                        "Are you sure ?",
                        context, () {
                      context.read<RegisterBloc>().add(InterfaceLanguageChange(
                          choosenLanguage: state.languageToLearn));
                    }, () {
                      context.read<RegisterBloc>().add(CancelLanguageChange(
                          choosenLanguage: state.languageToLearnCopy));
                    });
                  }
                } else if (state is InitialSetupDone) {
                  context.go(AppRouter.home);
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
                  } else {
                    return LoadingData();
                  }
                },
              ),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              DialogManager.showErrorDialog(
                  CustomError(
                      title: "Error",
                      message:
                          "The error occurred when trying to load data from the server."),
                  context, () {
                context.go(AppRouter.authScreen);
              });
            });

            return Container();
          }
        });
  }
}
