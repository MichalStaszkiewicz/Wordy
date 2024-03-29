import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/models/word_collection.dart';
import 'package:wordy/global/global_data_manager.dart';

import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import '../../../domain/logic/user_service.dart';
import '../../../domain/models/word_collection.dart';

class VocabularyListEntry extends StatelessWidget {
  const VocabularyListEntry({
    super.key,
    required this.vocabulary,
  });

  final WordCollection vocabulary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.pushNamed(AppRouter.vocabularyTopicSelectedScreen,
              queryParameters: {
                'topic': translate['english']!['topic_label']
                    [vocabulary.topic.toLowerCase()]
              });
        },
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            locator<Urls>().imageUrl + vocabulary.image)),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'topic_label'][vocabulary.topic.toLowerCase()],
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                ),
              )
            ],
          ),
        ));
  }
}
