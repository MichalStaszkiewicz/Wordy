import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/confirm_button.dart';
import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';

class LanguageToLearnScreen extends StatelessWidget {
  const LanguageToLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        if (state is CreatingNewUserPreferences) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Language you want to learn",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Container(
                        child: ListView.builder(
                            itemCount: languages.length,
                            itemBuilder: (context, index) => ListTile(
                                  leading: Image(
                                    image: AssetImage(languages[index].image),
                                  ),
                                  title: Text(languages[index].label),
                                  trailing: state.userLanguageToLearn ==
                                          languages[index].label
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : null,
                                  onTap: () {
                                    context.read<UserProgressBloc>().add(
                                        CreatingNewUserPreferencesUpdate(
                                            userLanguageToLearn:
                                                languages[index].label,
                                            userNativeLanguage:
                                                state.userNativeLanguage));
                                  },
                                )))),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          context.read<UserProgressBloc>().add(CreateNewUser());
                          Navigator.pushNamed(context, '/home',
                           );
                        },
                        child: const ConfirmButton()))
              ],
            ),
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
