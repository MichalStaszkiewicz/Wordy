import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';
import 'package:wordy/presentation/widgets/login_button.dart';

import '../../utility/validator.dart';

class TokenSendedForm extends StatefulWidget {
  TokenSendedForm({super.key, required this.onSwitchToLogin});
  VoidCallBack onSwitchToLogin;
  @override
  State<TokenSendedForm> createState() => _TokenSendedFormState();
}

class _TokenSendedFormState extends State<TokenSendedForm> {
  late TextEditingController _tokenController;

  @override
  void initState() {
    _tokenController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Type Reset Password Token ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
            width: 250,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _tokenController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.security_rounded),
                  hintText: "token"),
            )),
        LoginButton(
          label: 'Submit',
          onPressed: () {
            context
                .read<RegisterBloc>()
                .add(ValidateResetPasswordToken(token: _tokenController.text));
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
