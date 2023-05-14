import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';
import 'package:wordy/presentation/widgets/confirm_button.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';

class NewUserFinishScreen extends StatefulWidget {
  const NewUserFinishScreen({super.key});

  @override
  State<NewUserFinishScreen> createState() => _NewUserFinishScreenState();
}

class _NewUserFinishScreenState extends State<NewUserFinishScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InterfaceDataProvider>(
      builder: (context, data, child) =>
          BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, qstate) {
          final state = qstate as CreatingNewUserPreferences;
          return Container(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                          ui_lang[data.interfaceLangauge]![
                              'register_account_is_ready'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: ktitlecolor,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        width: 500,
                        child: const Image(
                            image: AssetImage("assets/newserinishmage.png")))),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: 350,
                      child: Text(
                        ui_lang[data.interfaceLangauge]![
                            'register_finish_text'],
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: ktitlecolor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      context.read<UserProgressBloc>().add(CreateNewUser(
                          languageToLearn: state.userLanguageToLearn,
                          nativeLanguage: state.userNativeLanguage));
                      Navigator.pushNamed(
                        context,
                        '/home',
                      );
                    },
                    child: ConfirmButton(selected: true)),
              ],
            ),
          );
        },
      ),
    );
  }
}
