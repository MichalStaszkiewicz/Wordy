import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/interface_language.dart';
import 'package:wordy/domain/models/mode.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/domain/models/topic.dart';
import 'package:wordy/domain/models/user_course.dart';
import 'package:wordy/domain/models/vocabulary.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/current_course_widget.dart';
import 'package:wordy/utility/locator/service_locator.dart';

//CurrentCourseWidgetR
void main() {
  setUp((() => {
        locator.registerLazySingleton(() => Urls('http://192.168.55.106:1344',
            'http://192.168.55.106:1344/images/')),
        locator.registerLazySingleton(() => GlobalDataManager()),
        locator<GlobalDataManager>().interfaceLanguage = 'english'
      }));
  testWidgets('CurrentCourseWidget size test', (tester) async {
    tester.binding.platformDispatcher.displays.first.size =
        const Size(300, 800);
    tester.binding.platformDispatcher.displays.first.devicePixelRatio = 1.0;

    await tester.pumpWidget(Directionality(textDirection: TextDirection.ltr,
      child: CurrentCourseWidget(
        currentCourse: ActiveCourse(
            userCourse: UserCourse(
                course: Course(
                    name: 'polish',
                    image:
                        'https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657',
                    circularImage:
                        'https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657'),
                mode: Mode(vocabulary: Vocabulary()),
                interfaceLanguage: InterfaceLanguage(
                    name: 'english',
                    image:
                        'https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657',
                    circularImage:
                        "https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657")),
            finishedTopics: 2,
            knownWords: 10,
            totalProgress: 20,
            topicsCount: 10,
            topicProgress: [
              ProgressInTopic(
                  name: 'animals',
                  knownWords: 1,
                  wordsCount: 2,
                  topic: Topic(
                      name:
                          'https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657',
                      image:
                          'https://www.colonialflag.com/cdn/shop/products/united-arab-emirates-flag__88291.1639690378.1280.1280.jpg?v=1673391657'))
            ],
            totalWordsCount: 100),
      ),
    ));
  });
}
