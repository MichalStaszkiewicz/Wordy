import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';
import 'package:wordy/presentation/widgets/login_form.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import '../../Utility/dialog_manager.dart';
import '../../const/enums.dart';
import '../bloc/register/register_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/register_form.dart';
import '../widgets/reset_password_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthFormType currentForm = AuthFormType.login;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterInProgress) {
                  DialogManager.showLoadingDialog(
                      "loading in progress", '', context);
                } else if (state is RegisterSuccess) {
                  Navigator.pop(context);

                  DialogManager.showSuccessDialog(
                      'You successfully registered an account',
                      'Success',
                      context, () {
                    currentForm = AuthFormType.login;
                  });
                } else if (state is RegisterError) {
                  Navigator.pop(context);
                  DialogManager.showErrorDialog(
                      state.exception.toString(), 'Error', context, () {
                    currentForm = AuthFormType.register;
                  });
                } else {}
              },
            ),
            BlocListener<LoginBloc, LoginState>(listener: (context, state) {
              if (state is Authenticating) {
                DialogManager.showLoadingDialog(
                    "loading in progress", '', context);
              } else if (state is Authenticated) {
                Navigator.pop(context);

                DialogManager.showSuccessDialog(
                    'You successfully registered an account',
                    'Success',
                    context, () {
                  currentForm = AuthFormType.login;
                  state.registerCompleted
                      ? context.go('/home')
                      : context.go('/initial_settings');
                });
              } else if (state is LoginError) {
                Navigator.pop(context);
                DialogManager.showErrorDialog(
                    state.exception.toString(), 'Error', context, () {
                  currentForm = AuthFormType.login;
                });
              } else {}
            })
          ],
          child: Container(
            child: Center(
                child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: const Center(
                          child: Image(image: AssetImage(('assets/logo.png')))),
                    )),
                Expanded(
                  flex: 7,
                  child: Container(
                      alignment: Alignment.topCenter,
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
                          child: _buildForm(currentForm))),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(AuthFormType formType) {
    switch (formType) {
      case AuthFormType.login:
        return LoginForm(
          onSwitchToRegister: () {
            setState(() {
              currentForm = AuthFormType.register;
            });
          },
          onSwitchToResetPassword: () {
            setState(() {
              currentForm = AuthFormType.resetPassword;
            });
          },
        );
      case AuthFormType.register:
        return RegisterForm(
          onSwitchToLogin: () {
            setState(() {
              currentForm = AuthFormType.login;
            });
          },
        );
      case AuthFormType.resetPassword:
        return ResetPasswordForm(
          onSwitchToLogin: () {
            setState(() {
              currentForm = AuthFormType.login;
            });
          },
        );
    }
  }
}
