import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';


import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/widgets/button/confirm_button.dart';

import '../../Utility/locator/service_locator.dart';
import '../../global/global_data_manager.dart';

class RegisterFinish extends StatefulWidget {
  RegisterFinish({super.key, required this.onFinish});

  VoidCallBack onFinish;

  @override
  State<RegisterFinish> createState() => _RegisterFinishState();
}

class _RegisterFinishState extends State<RegisterFinish> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'register_account_is_ready'],
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ktitlecolor, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const Expanded(
              flex: 5,
              child: SizedBox(
                  width: 500,
                  child:
                      Image(image: AssetImage("assets/newserinishmage.png")))),
          Expanded(
            flex: 2,
            child: Center(
              child: SizedBox(
                width: 350,
                child: Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]!['register_finish_text'],
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
              onTap: widget.onFinish,
              child: const ConfirmButton(selected: true)),
        ],
      ),
    );
  }
}
