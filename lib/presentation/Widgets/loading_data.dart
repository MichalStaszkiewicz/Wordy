import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {
  LoadingData();
  @override
  Widget build(BuildContext context) {
    return  Center(child: Container(
      width: double.infinity,
      height: double.infinity,
      
      
      child: Container(child: Center(child: CircularProgressIndicator()))));
  }
}
