import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/consts.dart';

import 'package:wordy/domain/logic/settings_logic.dart';

import 'package:wordy/presentation/widgets/register_setting_course.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../const/enums.dart';
import '../../global/global_data_manager.dart';
import '../bloc/register/register_bloc.dart';

class InitialSettingsScreen extends StatefulWidget {
  const InitialSettingsScreen({super.key});

  @override
  State<InitialSettingsScreen> createState() => _InitialSettingsScreenState();
}

class _InitialSettingsScreenState extends State<InitialSettingsScreen> {
  Widget _buildSettingUpProfileForm(
    InitialSetupStatus registerStatus,
  ) {
    switch (registerStatus) {
      case InitialSetupStatus.choosingNativeLanguage:
        return const RegisterSettingCourse();

      default:
        return Container();
    }
  }

  final InitialSetupStatus _registerationStatus =
      InitialSetupStatus.choosingNativeLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()..add(const InitialSetupBegin()),
      child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              DialogManager.showErrorDialog(state.error, context, () {
                context.go(AppRouter.authScreen);
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
                        ui_lang[locator<GlobalDataManager>().interfaceLanguage]!['choose_your_course'],
                        style: Theme.of(context).textTheme.headlineSmall,
                      )))),
                  _buildSettingUpProfileForm(
                    _registerationStatus,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
