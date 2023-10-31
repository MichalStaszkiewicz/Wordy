import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:wordy/presentation/widgets/login_button.dart';
import 'package:wordy/utility/validator.dart';

import '../../../../Utility/locator/service_locator.dart';
import '../../../../global/global_data_manager.dart';

class UpdatePasswordForm extends StatefulWidget {
  UpdatePasswordForm({super.key, required this.onSwitchToLogin});
  VoidCallBack onSwitchToLogin;
  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  late TextEditingController _passwordController;
  String? _passwordErrorText;
  @override
  void initState() {
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          ui_lang[locator<GlobalDataManager>().interfaceLanguage]!['auth_form']
              ['new_password'],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
            width: 250,
            child: TextFormField(
              validator: (value) {
                if (value != null) {
                  Validator.passwordValidate(value);
                } else {
                  return "This field is required";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _passwordController,
              decoration: InputDecoration(
                  errorText: _passwordErrorText,
                  prefixIcon: const Icon(Icons.security_rounded),
                  hintText: ui_lang[locator<GlobalDataManager>()
                      .interfaceLanguage]!['auth_form']['password']),
            )),
        LoginButton(
          label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
              'auth_form']['submit'],
          onPressed: () {
            _passwordErrorText =
                Validator.passwordValidate(_passwordController.text);
            context
                .read<ResetPasswordBloc>()
                .add(UpdateUserPassword(password: _passwordController.text));
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
