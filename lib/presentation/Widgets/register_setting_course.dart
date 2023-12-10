import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';

import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/register_course_list.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
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
    return FutureBuilder<List<Course>>(
        future: locator<UserService>().getAvailableCourses().then((value) {
   
          if (value.isError) {
            throw Exception(
              translate[locator<GlobalDataManager>().interfaceLanguage]![
                  'server_messages']['server_loading_data_error'],
            );
          }
          return value.data!;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(flex: 8, child: Container());
          } else if (snapshot.data != null && snapshot.hasData) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    locator<DialogManager>().showLoadingDialogWithCancelButton(
                        translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['messages']['app_prepare'],
                        translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['messages']['loading'],
                        context, () {
                      locator.get<Repository>().cancelRequest();
                      context.go(AppRouter.loginScreen);
                    });
                  });
                }

                if (state is InitialSetupState) {
                  if (state.languageConflict) {
                    locator<DialogManager>().showQuestionDialog(
                        translate[locator<GlobalDataManager>()
                                .interfaceLanguage]!['messages']
                            ['language_conflict'],
                        translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['messages']['are_your_sure'],
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
                    return Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                                child: Center(
                                    child: Text(
                              translate[locator<GlobalDataManager>()
                                  .interfaceLanguage]!['choose_your_course'],
                              style: Theme.of(context).textTheme.headlineSmall,
                            )))),
                        RegisterCourseList(
                          currentLanguage: state.languageToLearn,
                          languages: snapshot.data!,
                          onNextStep: () {
                            if (state.languageToLearn != '') {
                              context.read<RegisterBloc>().add(
                                  FinishInitialSetup(
                                      currentCourse: state.languageToLearn));
                            } else {
                              locator<DialogManager>().showErrorDialog(
                                  CustomError(
                                      title: translate[
                                              locator<GlobalDataManager>()
                                                  .interfaceLanguage]![
                                          'server_messages']['error'],
                                      message: translate[
                                              locator<GlobalDataManager>()
                                                  .interfaceLanguage]![
                                          'messages']['select_language'],
                                      critical: true),
                                  context,
                                  () {});
                            }
                          },
                        ),
                      ],
                    );
                  } else {
                    return const LoadingData();
                  }
                },
              ),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              locator<DialogManager>().showErrorDialog(
                  CustomError(
                      critical: true,
                      title: translate[locator<GlobalDataManager>()
                          .interfaceLanguage]!['server_messages']['error'],
                      message: translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['server_messages']
                          ['server_loading_data_error']),
                  context, () {
                context.go(AppRouter.loginScreen);
              });
            });

            return Container();
          }
        });
  }
}
