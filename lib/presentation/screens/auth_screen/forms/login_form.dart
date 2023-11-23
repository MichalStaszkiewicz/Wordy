import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/button/login_button.dart';

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
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is Authenticated) {
              _emailController.clear();
              _passwordController.clear();
            }
          },
          child: AuthFormWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'auth_form']['login'],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                //email
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

                //password
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
                      onTap: () {},
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
                  onTap: () {},
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
