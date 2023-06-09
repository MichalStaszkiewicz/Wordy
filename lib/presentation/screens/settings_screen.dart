import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';

import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/const/consts.dart';

import '../../Utility/dialog_manager.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../widgets/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(ui_lang['English']!['settings_screen_app_bar'].toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white)),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsInitial) {
            return const LoadingData();
          }
          if (state is SettingsLoaded) {
            return const Settings();
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
}
