import 'package:flutter/material.dart';
import 'package:wordy/ProfileScreen/statistics_card.dart';
class StatisticsList extends StatelessWidget {
 StatisticsList({required this.navigation,required this.image,required this.label});
Widget? navigation;
String image;
String label;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            if(navigation!=null){

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>navigation!));
            }

          },
          child: Container(
                height: 100,child: StatisticsCard(current: 20, image: image, label: label, max: 100,),
              
              
              ),
        ));
  }
}
