import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      height: 100,
      width: 100,
    color: Colors.red,
      child: Stack(
        children: [
          Center(
            child: Container(
                
                  
              height: 30,
              width: 30,
              decoration: BoxDecoration(     
                  borderRadius: BorderRadius.circular(50), color: Colors.green),
            ),
          ),
        
          Positioned(
            top: 10,
            child: Center(
              child: Text(widget.label,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
            ),
          ),
                  
        ],
      ),
    );
  }
}
