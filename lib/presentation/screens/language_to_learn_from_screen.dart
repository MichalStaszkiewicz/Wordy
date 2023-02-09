import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/confirm_button.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/shared/consts.dart';

class LanguageToLearnFromScreen extends StatelessWidget {
  const LanguageToLearnFromScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        state as CreatingNewUserPreferences;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Your native language",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
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
                                trailing: state.userNativeLanguage == languages[index].label
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                onTap: () {
                                  
                                  context.read<UserProgressBloc>().add(
                                      CreatingNewUserPreferencesUpdate(userLanguageToLearn:state.userLanguageToLearn , userNativeLanguage: languages[index].label
                                        ));
                                },
                              )))),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LanguageToLearnScreen()));
                    },
                    child: const ConfirmButton(),
                  ))
            ],
          ),
        );
      },
    );
  }
}
