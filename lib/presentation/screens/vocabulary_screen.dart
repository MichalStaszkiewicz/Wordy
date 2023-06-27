import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/const/consts.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/logic/user_service.dart';
import '../../domain/models/vocabulary.dart';
import '../../domain/models/word_collection.dart';
import '../../global/notification_provider.dart';
import '../bloc/courses_update/courses_update_bloc.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  List<GestureDetector> vocabularyItems(List<WordCollection> vocabularyList) {
    List<GestureDetector> result = [];
    for (WordCollection vocabulary in vocabularyList) {
      result.add(GestureDetector(
          onTap: () {
            context.pushNamed(AppRouter.vocabularyTopicSelectedScreen,
                queryParameters: {
                  'topic': ui_lang['english']!['topic_label']
                      [vocabulary.topic.toLowerCase()]
                });
          },
          child: Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.indigoAccent.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
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
                          image:
                              NetworkImage(Urls.kImageUrl + vocabulary.image)),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                        'topic_label'][vocabulary.topic.toLowerCase()],
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                  ),
                )
              ],
            ),
          )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VocabularyBloc()..add(LoadVocabulary()),
          child: BlocListener<VocabularyBloc, VocabularyState>(
            listener: (context, state) {
              if (state is VocabularyError) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  DialogManager.showErrorDialog(state.error, context, () {
                    if (state.error.critical) {
                      locator<UserService>()
                          .logOut()
                          .then((value) => context.go(AppRouter.authScreen));
                    }
                  });
                });
              }
            },
            child: BlocBuilder<VocabularyBloc, VocabularyState>(
              builder: (context, state) {
                if (state is VocabularyLoaded) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            ui_lang[locator<GlobalDataManager>()
                                .interfaceLanguage]!['vocabulary'],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20,
                                  letterSpacing: 0.5,
                                  color: Color.fromRGBO(30, 30, 30, 1.0),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 350,
                          child: Center(
                            child: TextField(
                              onChanged: (value) {
                                context.read<VocabularyBloc>().add(
                                    SearchForSpecificVocabulary(text: value));
                              },
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: ui_lang[locator<GlobalDataManager>()
                                        .interfaceLanguage]![
                                    'vocabulary_screen_search_hint'],
                                hintStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: AnimationList(
                          children: [
                            ...vocabularyItems(state.vocabularyListSearched)
                          ],
                        )),
                      ],
                    ),
                  );
                } else if (state is VocabularyInitial) {
                  return const LoadingData();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
