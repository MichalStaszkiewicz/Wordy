import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';
import 'package:wordy/presentation/widgets/login_form.dart';

import '../../Utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../Utility/socket_manager.dart';
import '../../const/app_router.dart';
import '../../const/enums.dart';

import '../../domain/models/custom_error.dart';
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
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterInProgress) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showLoadingDialogWithCancelButton(
                      "Creating your account please Wait",
                      'Loading in progress',
                      context, () {
                    locator.get<Repository>().cancelRequest();
                  });
                } else if (state is RegisterSuccess) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showSuccessDialog(
                      'You successfully registered an account',
                      'Success',
                      context, () {
                    currentForm = AuthFormType.login;
                    setState(() {});
                  });
                } else if (state is RegisterError) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showErrorDialog(state.error, context, () {
                    currentForm = AuthFormType.register;
                  });
                } else {}
              },
            ),
            BlocListener<LoginBloc, LoginState>(listener: (context, state) {
              if (state is LoggedOut) {}
              if (state is Authenticating) {
                DialogManager.showLoadingDialogWithCancelButton(
                    "loading in progress", '', context, () {
                  locator<Repository>().cancelRequest().then((value) => context
                      .read<LoginBloc>()
                      .add(LogOut(errorMessage: 'Request Failed')));
                });
              } else if (state is Authenticated) {
                context.pop();
                final socketManager = locator<SocketManager>();
                print(state.token);
                socketManager.initialize(state.token);

                socketManager.joinRoom(state.token);

                state.registerCompleted
                    ? context.pushNamed(AppRouter.home)
                    : context.pushNamed(AppRouter.initialSettings);
              } else if (state is LoginError) {
                if (context.canPop()) {
                  Navigator.pop(context);
                }

                DialogManager.showErrorDialog(state.error, context, () {
                  context
                      .read<LoginBloc>()
                      .add(LogOut(errorMessage: 'errorMessage'));

                  currentForm = AuthFormType.login;
                });
              }
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
