import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/loading_data.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/shared/consts.dart';

import '../Widgets/select_language_dialog.dart';
import '../Widgets/settings.dart';
import '../Widgets/settings_on_off_option.dart';

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
        title: Consumer<InterfaceDataProvider>(builder: (context,value,child)=>Center(
            child: Text(ui_lang[value.interfaceLangauge]!['settings_screen_app_bar'].toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white)),
          ),
       
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
