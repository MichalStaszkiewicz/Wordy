import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';

class StepperEntry extends StatefulWidget {
  StepperEntry(
      {super.key, required this.step,
      required this.label,
      required this.statusEntryIndex});
  String label;
  int step;
  int statusEntryIndex;

  @override
  State<StepperEntry> createState() => _StepperEntryState();
}

class _StepperEntryState extends State<StepperEntry> {
  Color properTextColorBaseOnState() {
    if (widget.step > widget.statusEntryIndex) {
      return kactivestatuscolor;
    } else if (widget.step == widget.statusEntryIndex) {
      return ktitlecolor;
    } else {
      return kdisabledcolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                border: Border.all(
                  color: widget.step >= widget.statusEntryIndex
                      ? kactivestatuscolor
                      : kdisabledcolor,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: widget.step >= widget.statusEntryIndex
                        ? kactivestatuscolor
                        : null,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 100,
              child: Center(
                child: AutoSizeText(
                  widget.label,
                  maxLines: 1,
                  minFontSize: 4,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: properTextColorBaseOnState(),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
