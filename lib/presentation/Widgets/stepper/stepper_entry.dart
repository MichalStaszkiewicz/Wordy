import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wordy/shared/consts.dart';

class StepperEntry extends StatefulWidget {
  StepperEntry({required this.step, required this.label});
  String label;
  int step;

  @override
  State<StepperEntry> createState() => _StepperEntryState();
}

class _StepperEntryState extends State<StepperEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(color: kdisabledcolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: kactivestatuscolor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              child: Center(
                child: AutoSizeText(
                  
                  widget.label,
                  maxLines: 1,minFontSize: 10,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kactivestatuscolor, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
