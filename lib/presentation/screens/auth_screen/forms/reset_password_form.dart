import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/button/login_button.dart';

import '../../../../utility/validator.dart';
import '../../../bloc/reset_password/reset_password_bloc.dart';

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
          ui_lang[locator<GlobalDataManager>().interfaceLanguage]!['auth_form']
              ['reset_password'],
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
                  hintText: ui_lang[locator<GlobalDataManager>()
                      .interfaceLanguage]!['auth_form']['email']),
            )),
        LoginButton(
          label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
              'auth_form']['submit'],
          onPressed: () {
            _emailErrorText = Validator.emailValidate(_emailController.text);
            context
                .read<ResetPasswordBloc>()
                .add(RecoverAccount(email: _emailController.text));
            setState(() {});
          },
        ),
        GestureDetector(
          onTap: widget.onSwitchToLogin,
          child: Text(
            ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                'auth_form']['back_to_login'],
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
          ),
        )
      ],
    );
  }
}


