import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/data/local/local_storage.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/utility/utility.dart';

import 'Utility/locator/service_locator.dart';
import 'domain/repositiories/stream_repository.dart';

class App extends StatefulWidget {
  const App({required Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final NotificationProvider notificationProvider = NotificationProvider();
  @override
  void initState() {
    locator<StreamRepository>().initialize();

    super.initState();
  }

  void disepose() {
    notificationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: notificationProvider,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Wordy',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoSlabTextTheme(),
          primarySwatch: Colors.blue,
        ),
        builder: (context, router) {
          var language = locator<Repository>().getUserInterfaceLanguage();

          if (language.isError) {
            final locale = Localizations.localeOf(context);
            locator<GlobalDataManager>().languageFromCode(locale.languageCode);
          } else {
            locator<GlobalDataManager>().interfaceLanguage = language.data!;
          }
          return Stack(
            children: [
              router!,
              _buildOverlay(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOverlay() {
    return IgnorePointer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IgnorePointer(
          child: Container(
            color: Colors.transparent,
            child: Consumer<NotificationProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Builder(builder: (BuildContext context) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) async {
                      await Utility.showAchievementNotifications(
                              value.achievementNotifications, context)
                          .then((_) => value.achievementNotifications.clear());
                    },
                  );

                  return Container(
                    child: const Stack(children: []),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
