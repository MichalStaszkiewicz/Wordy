import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/confirm_button.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';

class NewUserFinishScreen extends StatefulWidget {
  const NewUserFinishScreen({super.key});

  @override
  State<NewUserFinishScreen> createState() => _NewUserFinishScreenState();
}

class _NewUserFinishScreenState extends State<NewUserFinishScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, qstate) {
        final state = qstate as CreatingNewUserPreferences;
        return Container(
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text("Your account is ready!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ktitlecolor,fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                      width: 500,
                      child: const Image(
                          image: AssetImage("assets/newserinishmage.png")))),
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    width: 350,
                    child: Text(
                      "Thank you for joining us on this language learning journey. We're excited to help you achieve your language learning goals",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ktitlecolor, fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    context.read<UserProgressBloc>().add(CreateNewUser(
                        languageToLearn: state.userLanguageToLearn,
                        nativeLanguage: state.userNativeLanguage));
                    Navigator.pushNamed(
                      context,
                      '/home',
                    );
                  },
                  child: ConfirmButton(selected: true)),
            ],
          ),
        );
      },
    );
  }
}
