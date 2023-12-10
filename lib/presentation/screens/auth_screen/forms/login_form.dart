import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/button/login_button.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/socket_manager.dart';
import 'package:wordy/utility/utility.dart';
import '../../../../const/app_router.dart';
import '../../../../utility/validator.dart';
import '../../../bloc/login/login_bloc.dart';
import '../auth_form_wrapper.dart';

class LoginForm extends StatefulWidget {
  LoginForm();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is Authenticated) {
              _emailController.clear();
              _passwordController.clear();

              Utility.authenticatedUserNavigation(state, context);
            }
            if (state is LoginError) {
              locator<DialogManager>()
                  .showErrorDialog(state.error, context, () {});
            }
            if (state is Authenticating) {
              locator<DialogManager>().showLoadingDialogWithCancelButton(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'auth_form']['messages']['logging_in'],
                  '',
                  context, () {
                locator<Repository>().cancelRequest().then((value) => context
                    .read<LoginBloc>()
                    .add(LogOut(message: 'Request Failed')));
              });
            }
          },
          builder: (context, state) => AuthFormWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'auth_form']['login'],
                  style: Theme.of(context).textTheme.headlineSmall,
                  key: Key('login_form_title_key'),
                ),
                SizedBox(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          errorText: _emailErrorText,
                          prefixIcon: const Icon(Icons.email),
                          hintText: translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['auth_form']['email']),
                    )),
                SizedBox(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscurePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          errorText: _passwordErrorText,
                          suffix: IconButton(
                              onPressed: () {
                                if (_obscurePassword == false) {
                                  _obscurePassword = true;
                                } else {
                                  _obscurePassword = false;
                                }
                                setState(() {});
                              },
                              icon: const Icon(Icons.remove_red_eye)),
                          prefixIcon: const Icon(Icons.password),
                          hintText: translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['auth_form']['password']),
                    )),
                Container(
                    padding: const EdgeInsets.only(right: 50),
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed(AppRouter.forgotPasswordScreen);
                      },
                      child: Text(
                        translate[locator<GlobalDataManager>()
                                .interfaceLanguage]!['auth_form']
                            ['forgot_password'],
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            color: Color.fromRGBO(73, 79, 85, 1)),
                      ),
                    )),
                LoginButton(
                    label: translate[locator<GlobalDataManager>()
                        .interfaceLanguage]!['auth_form']['login'],
                    onPressed: () {
                      _emailErrorText =
                          Validator.emailValidate(_emailController.text);
                      context.read<LoginBloc>().add(Login(
                          email: _emailController.text,
                          password: _passwordController.text));

                      setState(() {});
                    }),
                GestureDetector(
                  key: Key('login_form_go_to_register_button_key'),
                  onTap: () {
                    context.goNamed(AppRouter.registerScreen);
                  },
                  child: Text(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'auth_form']['first_time_user'],
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
