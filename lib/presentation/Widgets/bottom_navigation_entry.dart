import 'package:flutter/material.dart';

class BottomNavigationEntry extends StatefulWidget {
  BottomNavigationEntry(
      {super.key, required this.label, required this.icon, required this.index});
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
      child: GestureDetector(
        onTap: () {
          //   value.setCurrentScreen(widget.index);
        },
        child: Container(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors
                  .red, //value.currentIndex == widget.index ? Colors.green : null,
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
                          color:
                              widget.index == 0 ? Colors.white : Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      0 == widget.index
                          ? Text(
                              widget.label,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: widget.index == 0
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
    );
  }
}
