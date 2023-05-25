import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/widgets/topic_grid_view.dart';

import 'package:wordy/presentation/screens/topic_screen_today_statistics.dart';
import 'package:wordy/const/consts.dart';

import '../widgets/circular_precentage_chart.dart';
import '../widgets/current_course_widget.dart';
import '../widgets/daily_challange_widget.dart';
import '../widgets/difficulty_level_widget.dart';
import '../widgets/language_tile.dart';
import '../widgets/loading_data.dart';
import '../widgets/unexpected_error.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen();
  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            pinned: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.format_align_left_sharp,
                      color: Colors.black),
                  Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20,
                          child: Image.network(
                              'https://img.freepik.com/free-vector/illustration-uk-flag_53876-18166.jpg?w=1800&t=st=1684872263~exp=1684872863~hmac=c8c2de3dad0bedeb9696406b3a212375d6e00dba7bd0c041fba6be49a21374bc'),
                        ),
                        Text('English',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black)),
                        Container(
                            height: 20,
                            alignment: Alignment.bottomCenter,
                            child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CurrentCourseWidget(),
          ),
          SliverToBoxAdapter(
            child: DailyChallangeWidget(),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Your courses',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.go('/selected_course');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 170,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 6),
                            blurRadius: 6.0,
                          )
                        ],
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Spanish",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                ),
                                Text(
                                  "Begginer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 60,
                            child: Container(
                              width: 100,
                              height: 60,
                              child: CircularPercentageChart(
                                progress: 75.0,
                                progressColor: Colors.white,
                                backgroundColor: Colors.white54,
                                strokeWidth: 2.0,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                                optionalWidget: null,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
