import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/topics/topics_bloc.dart';

class TopicItem extends StatefulWidget {
  TopicItem({required this.image, required this.label, required this.color,required this.index});
  String label;
  String image;
  Color color;
  int index;
  @override
  State<TopicItem> createState() => _TopicItemState();
}

class _TopicItemState extends State<TopicItem> with TickerProviderStateMixin {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        if (state is TopicsLoaded) {
          return GestureDetector(
            onTapDown: (details) {
              context.read<TopicsBloc>().add(ChooseSettingsForQuiz(
                  localPosition: details.localPosition,
                  globalPosition: details.globalPosition,
                  settingsOpen: !state.selectedTopic, index: widget.index));
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ], color: widget.color, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Image(
                            width: 70,
                            height: 70,
                            image: AssetImage(widget.image)),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Container(
                              width: 200,
                              height: 20,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: AutoSizeText(
                                minFontSize: 15,
                                widget.label,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
