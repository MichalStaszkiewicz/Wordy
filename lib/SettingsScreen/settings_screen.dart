import 'package:flutter/material.dart';
import 'package:wordy/SettingsScreen/select_language_dialog.dart';
import 'package:wordy/SettingsScreen/settings_on_off_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void print_something() {
    print("something");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SettingsOnOffOption(
              icon: Icons.dark_mode,
              title: "Theme",
              subtitle:
                  "Use this option if you want to switch to other theme mode",
              callback: () {},
            ),
            Container(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const Image(
                              image: AssetImage('assets/united-kingdom.png')))),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context, builder: (_) => LanguageDialog());

                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Interface language",
                                  style: Theme.of(context).textTheme!.subtitle1,
                                )),
                            Text(
                              "Use this option if you want to change interface language",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
