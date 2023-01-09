import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChoosenTopicVocabulary extends StatefulWidget {
  const ChoosenTopicVocabulary({super.key});

  @override
  State<ChoosenTopicVocabulary> createState() => _ChoosenTopicVocabularyState();
}

class _ChoosenTopicVocabularyState extends State<ChoosenTopicVocabulary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index) => Container(height: 100,
              child: Row(
                    children: [
                      Text("Informations"),
                      Text("Informacje"),
                     
                    ],
                  ),
            )),
      ),
    );
  }
}
