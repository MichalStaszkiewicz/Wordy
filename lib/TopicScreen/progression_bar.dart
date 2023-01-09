import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ProgressionBar extends StatefulWidget {
  ProgressionBar({required this.image, required this.percentage});
  String image;
  double percentage;

  @override
  State<ProgressionBar> createState() => _ProgressionBarState();
}

class _ProgressionBarState extends State<ProgressionBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.image))),
              )),
          Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.only(left:10,right: 10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Container(
                          width: (constraints.maxWidth-50)*(widget.percentage/100),
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 3, 206, 10)),
                        ),
                       
                       
                      ],
                    );
                    ;
                  },
                ),
              )),
        ],
      ),
    );
  }
}
