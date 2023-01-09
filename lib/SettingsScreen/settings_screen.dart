import 'package:flutter/material.dart';
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
            style: Theme.of(context).textTheme.headline5,
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
                callback: print_something,
                icon: Icons.dark_mode,
                title: "Theme",
                subtitle:
                    "Use this option if you want to switch to other theme mode"),
            SettingsOnOffOption(
                callback: (){
                  print_something();
                  setState(() {
                    
                  });
                },
                icon: Icons.dark_mode,
                title: "Theme",
                subtitle:
                    "Use this option if you want to switch to other theme mode")
          ],
        ),
      ),
    );
  }
}
