
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class TopicItemFront extends StatefulWidget {
TopicItemFront({required this.label,required this.image,required this.color});
String label;
String image;
Color color;
  @override
  State<TopicItemFront> createState() => _TopicItemFrontState();
}

class _TopicItemFrontState extends State<TopicItemFront> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
     
          color: widget.color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image(
                    width: 70, height: 70, image: AssetImage(widget.image)),
              ),
            ),
            Expanded(
                flex: 1,
                child: LayoutBuilder(
                  builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      width: 200,
                      height: 20,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: AutoSizeText(
                        minFontSize: 15,
                        widget.label,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
