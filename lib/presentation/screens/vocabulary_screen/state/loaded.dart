import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/domain/models/word_collection.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/list_entry.dart';

import '../../../../const/consts.dart';

class VocabularyLoadedScreen extends StatelessWidget {
  const VocabularyLoadedScreen({
    super.key,
    required this.items,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;
  final List<WordCollection> items;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'vocabulary'],
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                    letterSpacing: 0.5,
                    color: const Color.fromRGBO(30, 30, 30, 1.0),
                  ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 350,
            child: Center(
              child: TextField(
                onChanged: (value) {
                  context
                      .read<VocabularyBloc>()
                      .add(SearchForSpecificVocabulary(text: value));
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: ui_lang[locator<GlobalDataManager>()
                      .interfaceLanguage]!['vocabulary_screen_search_hint'],
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) =>
                VocabularyListEntry(vocabulary: items[index]),
          )),
        ],
      ),
    );
  }
}
