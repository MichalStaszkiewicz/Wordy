import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class VocabularyFrontCard extends StatelessWidget {
  const VocabularyFrontCard({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Center(
            child: AutoSizeText(
              maxLines: 2,
              textAlign: TextAlign.center,
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
