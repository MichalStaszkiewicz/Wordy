import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/const/consts.dart';

import 'package:wordy/presentation/widgets/register_setting_course.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

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
      case InitialSetupStatus.choosingCourse:
        return const RegisterSettingCourse();

      default:
        return Container();
    }
  }

  final InitialSetupStatus _registerationStatus =
      InitialSetupStatus.choosingCourse;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()..add(const InitialSetupBegin()),
      child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              locator<DialogManager>().showErrorDialog(state.error, context,
                  () {
                context.go(AppRouter.loginScreen);
              });
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildSettingUpProfileForm(
              _registerationStatus,
            ),
          )),
    );
  }
}
