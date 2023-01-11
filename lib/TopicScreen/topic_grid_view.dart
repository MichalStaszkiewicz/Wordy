import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/TopicScreen/topic_item.dart';

import '../bloc/topics/topics_bloc.dart';



class TopicGridView extends StatelessWidget {
  const TopicGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        if (state is TopicsLoaded) {
          return SliverGrid(
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TopicItem(
                  image: state.topics[index].image,
                  color: Colors.white,
                  label: state.topics[index].name, index: index,
                );
              },
              childCount: state.topics.length,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
