import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50,bottom: 50,left:40,right:40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.blue),
        color: Colors.white,
      ),
      child:  Center(
        child: Text('Confirm',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.blue),),
      ),
    );
  }
}
