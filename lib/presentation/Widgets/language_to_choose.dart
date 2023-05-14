import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';

import '../../domain/models/language.dart';

class LanguageToChoose extends StatelessWidget {
  LanguageToChoose(
      {required this.function,
      required this.index,
      required this.language,
      required this.listLangs,
      });
  int index;
  VoidCallback function;
  String language;
  List<Language> listLangs;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: AssetImage(listLangs[index].image),
      ),
      title: Text(listLangs[index].label),
      trailing: language == listLangs[index].label
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : null,
      onTap: 
        function,
   
    );
  }
}
