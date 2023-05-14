import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/widgets/progress_of_new_user_configuration.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/language_to_learn_from_screen.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/presentation/screens/new_user_finish_screen.dart';

class NewUserScreen extends StatelessWidget {
  const NewUserScreen({super.key});

  Widget checkStateOfConfiguration(int step) {
    if (step == 1) {
      return Expanded(
        flex: 3,
        child: Container(child: LanguageToLearnFromScreen()),
      );
    }
    if (step == 2) {
      return Expanded(
        flex: 3,
        child: Container(child: LanguageToLearnScreen()),
      );
    } else {
      return Expanded(flex: 3, child: NewUserFinishScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        if (state is CreatingNewUserPreferences) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(child: ProgressOfNewUserConfiguration()),
                  ),
                  checkStateOfConfiguration(state.step),
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
