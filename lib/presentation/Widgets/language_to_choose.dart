import 'package:flutter/cupertino.dart';
import 'package:wordy/presentation/widgets/language_tile.dart';

import '../../domain/models/interface_language.dart';

class LanguageToChoose extends StatelessWidget {
  LanguageToChoose({required this.title, required this.languages});
  String title;
  List<InterfaceLanguage> languages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text(title),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) => LanguageTile(
                      language: languages[index].name,
                      imagePath: languages[index].image, onSelect: () {  },  selectedLangauge: '',)),
            ),
          )
        ],
      ),
    );
  }
}
