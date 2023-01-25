import 'package:flutter/material.dart';

class VocabularyBackCard extends StatefulWidget {
  VocabularyBackCard({required this.label});
  final String label;

  @override
  State<VocabularyBackCard> createState() => _VocabularyBackCardState();
}

class _VocabularyBackCardState extends State<VocabularyBackCard> {
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
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}
