import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/topics/topics_bloc.dart';
import 'package:wordy/TopicScreen/quiz_options.dart';

import 'package:wordy/TopicScreen/topic_grid_view.dart';
import 'package:wordy/TopicScreen/topic_screen_today_statistics.dart';

import '../Bloc/user_settings_and_preferences/user_settings_and_preferences_bloc.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  ScrollController _controller = ScrollController();
  Positioned quizSettings(bool show, Offset localPosition,
      Offset globalPosition, int index, String name) {
    if (show == true) {
      var deviceDimensions = MediaQuery.of(context).size;
      Offset showMenuPosition = Offset(globalPosition.dx - localPosition.dx,
          globalPosition.dy - localPosition.dy);

      if (showMenuPosition.dy < 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - (showMenuPosition.dy)) - localPosition.dy);
        _controller.animateTo(_controller.offset + (showMenuPosition.dy),
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy + 30,
          left: offsetAfterJump.dx,
          child: QuizOptions(
            topicName: name,
          ),
        );
      } else if (deviceDimensions.height < showMenuPosition.dy + 180 &&
          showMenuPosition.dy > 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - 180) - localPosition.dy);
        _controller.animateTo(_controller.offset + 180,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy,
          left: offsetAfterJump.dx,
          child: QuizOptions(
            topicName: name,
          ),
        );
      } else {
        return Positioned(
          top: showMenuPosition.dy,
          left: showMenuPosition.dx,
          child: QuizOptions(
            topicName: name,
          ),
        );
      }
    } else {
      return Positioned(child: Container());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        if (state is TopicsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TopicsLoaded) {
          return GestureDetector(
            onTap: () {
              context.read<TopicsBloc>().add(ChooseSettingsForQuiz(
                  globalPosition: state.globalPosition,
                  index: state.index,
                  localPosition: state.localPosition,
                  settingsOpen: false));
            },
            child: Stack(children: [
              CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Center(
                        child: Text(
                      "Topic",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    )),
                  ),
                  SliverAppBar(
                      backgroundColor: Colors.white,
                      pinned: true,
                      floating: true,
                      title: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/united-kingdom.png"))),
                              ),
                            ),
                            Expanded(
                              child: TopicScreenTodayStaticstics(
                                image: "assets/fire.png",
                                label: 0,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: TopicScreenTodayStaticstics(
                                  image: "assets/open-book.png",
                                  label: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  TopicGridView()
                ],
              ),
              quizSettings(
                  state.selectedTopic,
                  state.localPosition,
                  state.globalPosition,
                  state.index,
                  state.topics.elementAt(state.index).name)
            ]),
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
