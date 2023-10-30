import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Widgets/loading_data.dart';
import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_ready.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen>
    with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VocabularyBloc()..add(const LoadVocabulary()),
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
                  return VocabularyScreenReady(
                    items: state.vocabularyList,
                    textEditingController: _textEditingController,
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
