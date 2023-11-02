import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:wordy/presentation/widgets/login_button.dart';

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
          ui_lang[locator<GlobalDataManager>().interfaceLanguage]!['auth_form']
              ['type_reset_password_token'],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
            width: 250,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _tokenController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.security_rounded), hintText: "token"),
            )),
        LoginButton(
          label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
              'auth_form']['submit'],
          onPressed: () {
            context
                .read<ResetPasswordBloc>()
                .add(ValidateResetPasswordToken(token: _tokenController.text));
            setState(() {});
          },
        ),
        GestureDetector(
          onTap: widget.onSwitchToLogin,
          child: Text(
            textAlign: TextAlign.center,
            ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                'auth_form']['back_to_login'],
            style: const TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
          ),
        )
      ],
    );
  }
}
