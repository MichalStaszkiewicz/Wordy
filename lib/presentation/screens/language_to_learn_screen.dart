import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/widgets/confirm_button.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';
import '../widgets/language_to_choose.dart';
import '../widgets/loading_data.dart';

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
                  flex: 3,
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
                                          userNativeLanguageSelected: false,
                                          step: 2));
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
                        if (state.userLanguageToLearnSelected) {
                          context.read<UserProgressBloc>().add(
                              CreatingNewUserPreferencesUpdate(
                                  userLanguageToLearn:
                                      state.userLanguageToLearn,
                                  userNativeLanguage: state.userNativeLanguage,
                                  userLanguageToLearnSelected: false,
                                  userNativeLanguageSelected: true,
                                  step: 3));
                        }
                      },
                      child: ConfirmButton(
                        selected: state.userLanguageToLearnSelected,
                      )))
            ],
          );
        } else {
          return LoadingData();
        }
      },
    );
  }
}
