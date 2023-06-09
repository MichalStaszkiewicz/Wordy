
/*
class StatisticsList extends StatefulWidget {
  StatisticsList(
      {required this.navigation, required this.image, required this.label});
  Widget? navigation;
  String image;
  String label;

  @override
  State<StatisticsList> createState() => _StatisticsListState();
}

class _StatisticsListState extends State<StatisticsList> {


 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc,
        UserProgressState>(
      builder: (context, state) {
        if (state is UserLearnedWordsSpecificTopic) {
          return ListView.builder(
              itemCount: state.course.topicsCurrent.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (widget.navigation != null) {
                       
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      UserProgressBloc(),
                                  child: widget.navigation!,
                                )));
                      }
                    },
                    child: Container(
                      height: 100,
                      child: StatisticsCard(
                        current: state.course.topicsCurrent[widget.label]!,
                        image: widget.image,
                        label: state.course.entries[index].topic,
                        max: state.course.topicsMaximum[widget.label]!,
                      ),
                    ),
                  ));
        }
        if (state is UserLearnedWordsLoaded) {
          return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (widget.navigation != null) {
                        
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      UserProgressBloc()..add(LoadLearnedWorsdWithSpecificCourse(course:state.courses[index])),
                                  child: widget.navigation!,
                                )));
                      }
                    },
                    child: Container(
                      height: 100,
                      child: StatisticsCard(
                        current: state.courses[index].entries.length,
                        image: "assets/${flagWays[state.courses[index].courseName]}.png",
                        label: state.courses[index].courseName,
                        max: state.courses[index].maximum,
                      ),
                    ),
                  ));
        } else {
          return LoadingData();
        }
      },
    );
  }
}

*/