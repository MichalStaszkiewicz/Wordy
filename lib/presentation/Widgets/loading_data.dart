import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      
      
      child: Container(child: const Center(child: CircularProgressIndicator()))));
  }
}
