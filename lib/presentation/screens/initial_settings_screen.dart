import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/screens/progress_of_register_screen.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/presentation/widgets/register_setting_course.dart';
import 'package:wordy/presentation/screens/register_finish.dart';
import 'package:wordy/utility/locator/storage_locator.dart';

import '../../const/consts.dart';
import '../../const/enums.dart';
import '../bloc/register/register_bloc.dart';

class InitialSettingsScreen extends StatefulWidget {
  InitialSettingsScreen({super.key});

  @override
  State<InitialSettingsScreen> createState() => _InitialSettingsScreenState();
}

class _InitialSettingsScreenState extends State<InitialSettingsScreen> {
  Widget _buildSettingUpProfileForm(
    InitialSetupStatus registerStatus,
  ) {
    switch (registerStatus) {
      case InitialSetupStatus.choosingNativeLanguage:
        return RegisterSettingCourse();

      default:
        return UnexpectedError();
    }
  }

  InitialSetupStatus _registerationStatus =
      InitialSetupStatus.choosingNativeLanguage;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => locator<SettingsLogic>(),
      child: BlocProvider(
        create: (context) => RegisterBloc()..add(InitialSetupBegin()),
        child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLanguageChangeInfo) {
                DialogManager.showQuestionDialog(
                    state.message, 'Are you sure ?', context, () {
                  context.read<RegisterBloc>().add(InterfaceLanguageChange(
                        choosenLanguage: state.languageToLearn,
                      ));
                }, () {
                  context.read<RegisterBloc>().add(CancelLanguageChange(
                      choosenLanguage: state.langaugeOnCancel));
                });
              }
              if (state is RegisterError) {
                DialogManager.showErrorDialog(
                    state.exception.toString(), 'Error', context, () {
                  context.go('/');
                });
              }
            },
            child: Scaffold(
              body: Container(
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            child: Center(
                                child: Text(
                          "Choose Your Course",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )))),
                    _buildSettingUpProfileForm(
                      _registerationStatus,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
