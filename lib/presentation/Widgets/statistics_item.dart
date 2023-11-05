import 'package:flutter/material.dart';

class StatisticsItem extends StatelessWidget {
  StatisticsItem({
    super.key,
    required this.label,
    required this.statisticsCount,
    required this.image,
  });
  String label;
  String image;
  int statisticsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50, child: Image(image: AssetImage(image))),
            const SizedBox(height: 10.0),
            Container(
             width: double.infinity,
              child: Text(
                textAlign: TextAlign.center,
                label,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              child: Text(
                statisticsCount.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
