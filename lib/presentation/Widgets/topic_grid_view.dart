import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/widgets/topic_item.dart';

import 'loading_data.dart';

class TopicGridView extends StatelessWidget {
  TopicGridView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        if (state is TopicsLoaded) {
          return Container(
            child: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return TopicItem(
                    color: Colors.white,
                    label: state.topics[index].name,
                    index: index,
                    image: '',
                  );
                },
                childCount: state.topics.length,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: LoadingData());
        }
      },
    );
  }
}
