import 'package:flutter/material.dart';


class AchievemetnsScreen extends StatefulWidget {
  const AchievemetnsScreen({super.key});

  @override
  State<AchievemetnsScreen> createState() => _AchievemetnsScreenState();
}

class _AchievemetnsScreenState extends State<AchievemetnsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Container(
              child: Text(
                "Achievements",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
