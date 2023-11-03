import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/state/loaded.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_list_entry.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/const/consts.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../domain/logic/user_service.dart';
import '../../../domain/models/word_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_ready.dart';

import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_list_entry.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_ready.dart';


class VocabularyScreenReady extends StatelessWidget {
  VocabularyScreenReady({
    super.key,
    required this.textEditingController,
    required this.items,
  });

  final TextEditingController textEditingController;
  final List<WordCollection> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              translate[locator<GlobalDataManager>().interfaceLanguage]![
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
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: translate[locator<GlobalDataManager>()
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
            itemBuilder: (context, index) => VocabularyListEntry(
              vocabulary: items[index],
            ),
          )),
        ],
      ),
    );
  }
}
