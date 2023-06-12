import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/profile/profile_bloc.dart';

import '../../Utility/dialog_manager.dart';
import '../../const/app_router.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../widgets/loading_data.dart';
import '../widgets/profile_details.dart';

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
        create: (context) => ProfileBloc()..add(LoadProfileData()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileDataInit) {
              return const LoadingData();
            }
            if (state is ProfileDataReady) {
              return const ProfileDetails();
            } else {
              DialogManager.showErrorDialog(
                  ExceptionHelper.getErrorMessage(UnexpectedError()), context,
                  () {
                context.go(AppRouter.authScreen);
              });
              return Container();
            }
          },
        ),
      ),
    );
  }
}
