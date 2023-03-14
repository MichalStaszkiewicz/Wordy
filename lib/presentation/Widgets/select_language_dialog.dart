import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Widgets/loading_data.dart';
import 'package:wordy/presentation/Widgets/settings.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';
import 'package:wordy/shared/consts.dart';

import '../../domain/models/language.dart';
import '../Provider/interface_language_provider.dart';

class LanguageDialog extends StatelessWidget {
  LanguageDialog({required this.ctx});
  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(LoadSettings()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoaded) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                child: Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Consumer<InterfaceDataProvider>(
                          builder: (context, value, child) => Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Text(
                              ui_lang[value.interfaceLangauge]![
                                      'settings_screen_choose_interface_language']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Consumer<InterfaceDataProvider>(
                          builder: (context, value, child) => Expanded(
                            child: ListView.builder(
                              itemCount:
                                  languages_available_for_interface.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        languages_available_for_interface[index]
                                            .image),
                                  ),
                                  title: Text(
                                      languages_available_for_interface[index]
                                          .label),
                                  trailing: state.interfaceLanguage ==
                                          languages_available_for_interface[
                                                  index]
                                              .label
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : null,
                                  onTap: () {
                                    value.changeUserInterfaceLanguage(
                                        languages_available_for_interface[index]
                                            .label);
                                    ctx.read<SettingsBloc>().add(
                                        UpdateUserInterfaceLanguage(
                                            interfaceLanguage:
                                                languages_available_for_interface[
                                                        index]
                                                    .label));
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    )));
          } else {
            return LoadingData();
          }
        },
      ),
    );
  }
}
