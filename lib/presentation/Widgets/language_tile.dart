import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/bloc/register/register_bloc.dart';

import '../../const/urls.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../../utility/dialog_manager.dart';

class LanguageTile extends StatelessWidget {
  LanguageTile(
      {required this.language,
      required this.imagePath,
      required this.selectedLangauge,
      required this.onSelect});
  String language;
  String imagePath;
  String selectedLangauge;

  VoidCallBack onSelect;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(Urls.kImageUrl + imagePath),
        title: Text(language),
        trailing: selectedLangauge.toLowerCase() == language.toLowerCase()
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : null,
        onTap: onSelect);
  }
}
