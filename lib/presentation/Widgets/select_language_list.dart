import 'package:flutter/material.dart';
import 'package:wordy/domain/models/interface_language.dart';

import 'select_language_list_item.dart';

class SelectLanguageList extends StatefulWidget {
  SelectLanguageList(
      {required this.height,
      required this.interfaceLanguages,
      required this.isListExpanded});
  double height;
  List<InterfaceLanguage> interfaceLanguages;
  bool isListExpanded;

  @override
  State<SelectLanguageList> createState() => _SelectLanguageListState();
}

class _SelectLanguageListState extends State<SelectLanguageList> {
  @override
  Widget build(BuildContext context) {
    var interfaceLanguages = widget.interfaceLanguages;
    return Container(
      height: widget.height - 50,
      child: ListView.builder(
          itemCount: interfaceLanguages.length,
          itemBuilder: (context, index) {
            return SelectLanguageListItem(
              label: interfaceLanguages[index].name,
              image: interfaceLanguages[index].image,
              isListExpanded: widget.isListExpanded,
              itemIndex: index,
            );
          }),
    );
  }
}
