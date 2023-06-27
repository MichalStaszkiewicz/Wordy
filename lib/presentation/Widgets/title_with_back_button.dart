import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/widgets/exit_button.dart';

class TitleWithBackButton extends StatelessWidget {
  TitleWithBackButton({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const ExitButton())))),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: AutoSizeText(
                  maxLines: 1,
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      )),
    );
  }
}
