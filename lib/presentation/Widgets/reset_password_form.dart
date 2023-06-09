import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/presentation/widgets/login_button.dart';

import '../../utility/validator.dart';

class ResetPasswordForm extends StatefulWidget {
  ResetPasswordForm({super.key, required this.onSwitchToLogin});
  VoidCallBack onSwitchToLogin;
  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late TextEditingController _emailController;
  String? _emailErrorText;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Reset Password',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
        LoginButton(
          label: 'Submit',
          onPressed: () {
            _emailErrorText = Validator.emailValidate(_emailController.text);
            setState(() {});
          },
        ),
        GestureDetector(
          onTap: widget.onSwitchToLogin,
          child: const Text(
            textAlign: TextAlign.center,
            'Back to login',
            style: TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
          ),
        )
      ],
    );
  }
}
