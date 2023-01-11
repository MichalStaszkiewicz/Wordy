import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/topics/topics_bloc.dart';
import 'package:wordy/TopicScreen/quiz_options.dart';

import 'package:wordy/TopicScreen/topic_grid_view.dart';
import 'package:wordy/TopicScreen/topic_screen_today_statistics.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  ScrollController _controller = ScrollController();
  Positioned quizSettings(
      bool show, Offset localPosition, Offset globalPosition) {
    if (show == true) {
      Offset jumpTo = Offset(globalPosition.dx - localPosition.dx,
          globalPosition.dy - localPosition.dy);
          Offset nPos = Offset(globalPosition.dx - localPosition.dx,(globalPosition.dy-200));
      _controller.jumpTo(globalPosition.dy-200);

      return Positioned(
        top: jumpTo.dy,
        left: jumpTo.dx,
        child: QuizOptions(
          topicName: "Daily Usage",
        ),
      );
    } else {
      return Positioned(child: Container());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicsBloc()..add(LoadTopics()),
      child: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          if (state is TopicsLoaded) {
            return Stack(children: [
              CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
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
              quizSettings(state.selectedTopic, state.localPosition,
                  state.globalPosition)
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
