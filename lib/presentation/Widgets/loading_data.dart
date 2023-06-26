import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 200,
            height: 200,
            child: Container(
                child: const Center(child: CircularProgressIndicator()))));
  }
}
