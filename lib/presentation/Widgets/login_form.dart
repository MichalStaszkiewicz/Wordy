import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/presentation/widgets/login_button.dart';

import '../../utility/validator.dart';
import '../bloc/login/login_bloc.dart';

class LoginForm extends StatefulWidget {
  LoginForm(
      {super.key, required this.onSwitchToRegister,
      required this.onSwitchToResetPassword});
  VoidCallBack onSwitchToRegister;
  VoidCallBack onSwitchToResetPassword;
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Login',
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
                  hintText: "Email"),
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
                  hintText: "Password"),
            )),
        Container(
            padding: const EdgeInsets.only(right: 50),
            width: double.infinity,
            child: GestureDetector(
              onTap: widget.onSwitchToResetPassword,
              child: const Text(
                textAlign: TextAlign.right,
                'Forgot Password ?',
                style: TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
              ),
            )),
        LoginButton(
            label: 'Login',
            onPressed: () {
              _emailErrorText = Validator.emailValidate(_emailController.text);
              context.read<LoginBloc>().add(Login(
                  email: _emailController.text,
                  password: _passwordController.text));
              setState(() {});
            }),
        GestureDetector(
          onTap: widget.onSwitchToRegister,
          child: const Text(
            textAlign: TextAlign.center,
            'Don\'t have an account ? Sign-up',
            style: TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
          ),
        )
      ],
    );
  }
}
