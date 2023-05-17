import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/screens/progress_of_register_screen.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/language_to_learn_from_screen.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/presentation/screens/register_finish.dart';

import '../../const/enums.dart';
import '../bloc/register/register_bloc.dart';

class InitialSettingsScreen extends StatelessWidget {
  InitialSettingsScreen({super.key});

  Widget _buildSettingUpProfileForm(InitialSetupStatus registerStatus,
      String nativeLanguage, String courseLanguage, BuildContext context) {
    switch (registerStatus) {
      case InitialSetupStatus.choosingNativeLanguage:
        return RegisterSettingCourse(
          language: nativeLanguage,
          onLanguageChoice: () {
            context.read<RegisterBloc>().add(InitialSetupStateUpdate(
                languageToLearn: courseLanguage,
                nativeLanguage: nativeLanguage));
          },
          onNextStep: () {
            _registerationStatus = InitialSetupStatus.choosingCourse;
          },
        );

      case InitialSetupStatus.choosingCourse:
        return RegisterSettingCourse(
          language: courseLanguage,
          onLanguageChoice: () {
            context.read<RegisterBloc>().add(InitialSetupStateUpdate(
                languageToLearn: courseLanguage,
                nativeLanguage: nativeLanguage));
          },
          onNextStep: () {
            _registerationStatus = InitialSetupStatus.finish;
          },
        );
      case InitialSetupStatus.finish:
        return RegisterFinish(onFinish: () {
          context.read<RegisterBloc>().add(InitialSetupFinish(
              languageToLearn: courseLanguage, nativeLanguage: nativeLanguage));
        });
      default:
        return UnexpectedError();
    }
  }

  InitialSetupStatus _registerationStatus =
      InitialSetupStatus.choosingNativeLanguage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()
        ..add(InitialSetupStateUpdate(languageToLearn: '', nativeLanguage: '')),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is InitialSetupState) {
            return Scaffold(
              body: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: ProgressOfInitialSetup(
                        status: _registerationStatus,
                      )),
                    ),
                    _buildSettingUpProfileForm(_registerationStatus,
                        state.nativeLanguage, state.languageToLearn, context)
                  ],
                ),
              ),
            );
          } else {
            return UnexpectedError();
          }
        },
      ),
    );
  }
}
