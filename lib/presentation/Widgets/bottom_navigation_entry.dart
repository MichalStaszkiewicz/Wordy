import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Provider/interface_language_provider.dart';

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
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    color: widget.index == value.currentScreen
                        ? Colors.blueAccent
                        : Colors.grey),
                Text(
                  widget.label,
                  style:  TextStyle(
                      fontSize: 12,
                      color: widget.index == value.currentScreen
                          ? Colors.blueAccent
                          : Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
