import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';

import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/const/consts.dart';

import '../widgets/select_language_dialog.dart';
import '../widgets/settings.dart';
import '../widgets/settings_on_off_option.dart';

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
          child: Text(
               ui_lang['English']!['settings_screen_app_bar']
                  .toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white)),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsInitial) {
            return LoadingData();
          }
          if (state is SettingsLoaded) {
            return const Settings();
          } else {
            return UnexpectedError();
          }
        },
      ),
    );
  }
}
