import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/confirm_button.dart';
import 'package:wordy/presentation/Widgets/language_to_choose.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/shared/consts.dart';

class LanguageToLearnFromScreen extends StatelessWidget {
  LanguageToLearnFromScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        state as CreatingNewUserPreferences;
        return Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    child: ListView.builder(
                        itemCount: languages_available_for_interface.length,
                        itemBuilder: (context, index) => LanguageToChoose(
                              function: () {
                                context.read<UserProgressBloc>().add(
                                    CreatingNewUserPreferencesUpdate(
                                        userLanguageToLearn:
                                            state.userLanguageToLearn,
                                        userNativeLanguage:
                                            languages_available_for_interface[
                                                    index]
                                                .label,
                                        userLanguageToLearnSelected: false,
                                        userNativeLanguageSelected: true));
                              },
                              index: index,
                              language: state.userNativeLanguage,
                              listLangs: languages_available_for_interface,
                            )))),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => UserProgressBloc()
                                    ..add(CreatingNewUserPreferencesUpdate(
                                        userLanguageToLearn:
                                            state.userLanguageToLearn,
                                        userNativeLanguage:
                                            state.userNativeLanguage,
                                        userLanguageToLearnSelected: false,
                                        userNativeLanguageSelected: true)),
                                  child: const LanguageToLearnScreen(),
                                )));
                  },
                  child: ConfirmButton(
                    selected: state.userNativeLanguageSelected,
                  ),
                ))
          ],
        );
      },
    );
  }
}
