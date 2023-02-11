import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/confirm_button.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';
import '../Widgets/language_to_choose.dart';

class LanguageToLearnScreen extends StatelessWidget {
  const LanguageToLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        if (state is CreatingNewUserPreferences) {
          return Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                      child: ListView.builder(
                          itemCount: languages.length,
                          itemBuilder: (context, index) {
                            if (state.userNativeLanguage !=
                                languages[index].label) {
                              return LanguageToChoose(
                                function: () {
                                  context.read<UserProgressBloc>().add(
                                      CreatingNewUserPreferencesUpdate(
                                          userLanguageToLearn:
                                              languages[index].label,
                                          userNativeLanguage:
                                              state.userNativeLanguage,
                                          userLanguageToLearnSelected: true,
                                          userNativeLanguageSelected: false));
                                },
                                index: index,
                                language: state.userLanguageToLearn,
                                listLangs: languages,
                              );
                            } else {
                              return Container();
                            }
                          }))),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        context.read<UserProgressBloc>().add(CreateNewUser(
                            languageToLearn: state.userLanguageToLearn,
                            nativeLanguage: state.userNativeLanguage));
                        Navigator.pushNamed(
                          context,
                          '/home',
                        );
                      },
                      child: ConfirmButton(
                        selected: state.userLanguageToLearnSelected,
                      )))
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
