import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';
import 'package:wordy/presentation/widgets/confirm_button.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';
import '../bloc/login/login_bloc.dart';

class RegisterFinish extends StatefulWidget {
  RegisterFinish({required this.onFinish});

  VoidCallBack onFinish;

  @override
  State<RegisterFinish> createState() => _RegisterFinishState();
}

class _RegisterFinishState extends State<RegisterFinish> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(ui_lang['English']!['register_account_is_ready'],
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ktitlecolor, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                  width: 500,
                  child: const Image(
                      image: AssetImage("assets/newserinishmage.png")))),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: 350,
                child: Text(
                  ui_lang['English']!['register_finish_text'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ktitlecolor, fontSize: 20),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: widget.onFinish, child: ConfirmButton(selected: true)),
        ],
      ),
    );
  }
}
