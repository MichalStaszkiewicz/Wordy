import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Widgets/topic_item.dart';


class TopicGridView extends StatelessWidget {
TopicGridView();

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
