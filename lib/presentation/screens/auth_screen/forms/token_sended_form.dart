import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:wordy/presentation/widgets/button/login_button.dart';

class TokenSendedForm extends StatefulWidget {
  TokenSendedForm();

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
    return BlocProvider(
      create: (context) => ResetPasswordBloc(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            translate[locator<GlobalDataManager>().interfaceLanguage]![
                'auth_form']['type_reset_password_token'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
              width: 250,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _tokenController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security_rounded),
                    hintText: "token"),
              )),
          LoginButton(
            label: translate[locator<GlobalDataManager>().interfaceLanguage]![
                'auth_form']['submit'],
            onPressed: () {
              context.read<ResetPasswordBloc>().add(
                  ValidateResetPasswordToken(token: _tokenController.text));
              setState(() {});
            },
          ),
          GestureDetector(
            onTap: () {
              context.goNamed(AppRouter.loginScreen);
            },
            child: Text(
              translate[locator<GlobalDataManager>().interfaceLanguage]![
                  'auth_form']['back_to_login'],
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
            ),
          )
        ],
      ),
    );
  }
}
