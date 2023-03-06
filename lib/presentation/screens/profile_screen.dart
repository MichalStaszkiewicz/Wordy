import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/profile_details.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';

import 'package:wordy/shared/consts.dart';

import '../Provider/interface_language_provider.dart';

//TODO fixing UI. bloc is not updating profile also changing language is no showing proper data in vocabulary screen without helping statements. quiz is breaking when we skip all questions.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     context.read<UserProgressBloc>().add(LoadUserDataAndPreferences());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<InterfaceLanguageProvider>(
            builder: ((context, value, child) => Center(
                    child: Text(
                  ui_lang[value.interfaceLangauge]!['profile_screen_app_bar']
                      .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                )))),
      ),
      body: BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
          if (state is UserProgressInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserProgressLoaded) {
            print("Courses: "  + state.courses.toString());
            return ProfileDetails();
          } else {
            return UnexpectedError();
          }
        },
      ),
    );
  }
}
