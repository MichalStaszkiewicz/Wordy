import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';
import 'package:wordy/presentation/bloc/reset_password/reset_password_bloc.dart';

import 'package:wordy/presentation/screens/auth_screen/forms/login_form.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/register_form.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/reset_password_form.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/token_sended_form.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/update_password_form.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key, required child});
  Widget? child;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ResetPasswordBloc()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Center(
              child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                    alignment: Alignment.center,
                    child: Container(
                        height: 450,
                        width: 350,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black.withOpacity(.1),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: widget.child)),
              )
            ],
          )),
        ),
      ),
    );
  }
}
