import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/progress_of_new_user_configuration.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/language_to_learn_from_screen.dart';

class NewUserScreen extends StatelessWidget {
  const NewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        if (state is CreatingNewUserPreferences) {
          return Scaffold(
            body: Container(
              height: 1000,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(child: ProgressOfNewUserConfiguration()),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(child: LanguageToLearnFromScreen()),
                  ),
                ],
              ),
            ),
          );
        } else {
          return UnexpectedError();
        }
      },
    );
  }
}
