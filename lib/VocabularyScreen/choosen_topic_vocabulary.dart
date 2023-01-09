import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChoosenTopicVocabulary extends StatefulWidget {
  ChoosenTopicVocabulary({super.key, required this.topic});
  String topic;
  @override
  State<ChoosenTopicVocabulary> createState() => _ChoosenTopicVocabularyState();
}

class _ChoosenTopicVocabularyState extends State<ChoosenTopicVocabulary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              Text(widget.topic, style: Theme.of(context).textTheme.headline5),
        ),
      ),
      body: Container(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          spreadRadius: -4,
                          blurRadius: 7,
                          color: Color.fromRGBO(81, 77, 77, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.all(20),
                  height: 100,
                  width: 100,
                  child: Center(child: Text("Breakfast",style: Theme.of(context).textTheme.subtitle2,),),
                )),
      ),
    );
  }
}
