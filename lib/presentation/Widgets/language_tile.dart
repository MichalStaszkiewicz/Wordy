import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';

import '../../const/urls.dart';

class LanguageTile extends StatelessWidget {
  LanguageTile(
      {super.key,
      required this.language,
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
        title: Text(ui_lang[locator<GlobalDataManager>().interfaceLanguage]![language.toLowerCase()]),
        trailing: selectedLangauge.toLowerCase() ==
                language.toLowerCase()
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : null,
        onTap: onSelect);
  }
}
