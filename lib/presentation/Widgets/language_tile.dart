import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';

import '../../const/urls.dart';
import '../../domain/models/language.dart';

class LanguageTile extends StatelessWidget {
  LanguageTile({required this.language, required this.imagePath});
  String language;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is InitialSetupState) {
          return ListTile(
              leading: Image.network(Urls.kImageUrl + imagePath),
              title: Text(language),
              trailing: state.languageToLearn == language
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : null,
              onTap: () {
                context
                    .read<RegisterBloc>()
                    .add(InitialSetupStateUpdate(languageToLearn: language));
              });
        } else if (state is RegisterLanguageChangeInfo) {
          return ListTile(
              leading: Image.network(Urls.kImageUrl + imagePath),
              title: Text(language),
              trailing: state.languageToLearn == language
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : null,
              onTap: () {
                context
                    .read<RegisterBloc>()
                    .add(InitialSetupStateUpdate(languageToLearn: language));
              });
        } else if (state is RegisterError) {
          return ListTile(
              leading: Image.network(Urls.kImageUrl + imagePath),
              title: Text(language),
              trailing: null,
              onTap: () {
                context
                    .read<RegisterBloc>()
                    .add(InitialSetupStateUpdate(languageToLearn: ''));
              });
        } else {
          return UnexpectedError();
        }
      },
    );
  }
}
