import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/Utility/socket_manager.dart';
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
        body: MultiBlocListener(
          listeners: [
            BlocListener<ResetPasswordBloc, ResetPasswordState>(
                listener: (context, state) {
              if (state is ResetPasswordError) {
                DialogManager.showErrorDialog(state.error, context, () {
                  context.read<ResetPasswordBloc>().add(InitialResetPassword());
                });
              } else if (state is VerifiedToken) {
                DialogManager.showSuccessDialog(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'auth_form']['messages']['verified_token'],
                    'Success',
                    context, () {
                  //   widget.currentForm = AuthFormType.typeNewPassword;
                  setState(() {});
                });
              } else if (state is RecoverAccountMessageSended) {
                DialogManager.showSuccessDialog(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'auth_form']['messages']['sended_token'],
                    'Success',
                    context, () {
                  // widget.currentForm = AuthFormType.resetTokenSended;
                  setState(() {});
                });
              } else if (state is UserPasswordUpdated) {
                DialogManager.showSuccessDialog(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'auth_form']['messages']['updated_password'],
                    'Success',
                    context, () {
                  //   widget.currentForm = AuthFormType.login;
                  setState(() {});
                });
              }
            }),
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterInProgress) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showLoadingDialogWithCancelButton(
                      translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['auth_form']['messages']
                          ['creating_account_progress'],
                      translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['auth_form']['messages']
                          ['loading_in_progress'],
                      context, () {
                    locator.get<Repository>().cancelRequest();
                  });
                } else if (state is RegisterSuccess) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showSuccessDialog(
                      translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['auth_form']['messages']
                          ['register_account_success'],
                      'Success',
                      context, () {
                    // widget.currentForm = AuthFormType.login;
                    context.read<LoginBloc>().add(
                        Login(email: state.email, password: state.password));
                    setState(() {});
                  });
                } else if (state is RegisterError) {
                  if (context.canPop()) {
                    Navigator.pop(context);
                  }
                  DialogManager.showErrorDialog(state.error, context, () {
                    context.read<RegisterBloc>().add(const RegisterInit());
                  });
                } else {}
              },
            ),
            BlocListener<LoginBloc, LoginState>(listener: (context, state) {
              if (state is LoggedOut) {}
              if (state is Authenticating) {
                DialogManager.showLoadingDialogWithCancelButton(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'auth_form']['messages']['loading_in_progress'],
                    '',
                    context, () {
                  locator<Repository>().cancelRequest().then((value) => context
                      .read<LoginBloc>()
                      .add(LogOut(errorMessage: 'Request Failed')));
                });
              } else if (state is Authenticated) {
                if (context.canPop()) {
                  context.pop();
                }

                final socketManager = locator<SocketManager>();

                socketManager.initialize(state.token);

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

                  //    widget.currentForm = AuthFormType.login;
                });
              }
            })
          ],
          child: Container(
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
      ),
    );
  }
}
