import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';

import 'package:wordy/const/consts.dart';

import '../../Utility/dialog_manager.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../widgets/loading_data.dart';
import '../widgets/profile_details.dart';

//TODO fixing UI. bloc is not updating profile also changing language is no showing proper data in vocabulary screen without helping statements. quiz is breaking when we skip all questions.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            UserProgressBloc()..add(LoadUserDataAndPreferences()),
        child: BlocBuilder<UserProgressBloc, UserProgressState>(
          builder: (context, state) {
            if (state is UserProgressInitial) {
              return const LoadingData();
            }
            if (state is UserProgressLoaded) {
              return const ProfileDetails();
            } else {
              DialogManager.showErrorDialog(
                  ExceptionHelper.getErrorMessage(UnexpectedError()), context,
                  () {
                context.go('/');
              });
              return Container();
            }
          },
        ),
      ),
    );
  }
}
