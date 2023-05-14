import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/interface_language_provider.dart';

class BottomNavigationEntry extends StatefulWidget {
  BottomNavigationEntry(
      {required this.label, required this.icon, required this.index});
  String label;
  IconData icon;
  int index;

  @override
  State<BottomNavigationEntry> createState() => _BottomNavigationEntryState();
}

class _BottomNavigationEntryState extends State<BottomNavigationEntry> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<InterfaceDataProvider>(
        builder: (context, value, child) => GestureDetector(
          onTap: () {
            value.setCurrentScreen(widget.index);
          },
          child: Container(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color:
                    value.currentIndex == widget.index ? Colors.green : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) => Stack(children: [
                  
                  Positioned(
                    top: constraints.maxHeight / 4,
                    left: constraints.maxWidth / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(widget.icon,
                            color: widget.index == value.currentIndex
                                ? Colors.white
                                : Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        value.currentIndex == widget.index
                            ? Text(
                                widget.label,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: widget.index == value.currentIndex
                                        ? Colors.white
                                        : Colors.grey),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
