import 'package:flutter/material.dart';

class AddNewCourseItem extends StatelessWidget {
  const AddNewCourseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              style: BorderStyle.solid,
              color: const Color.fromARGB(255, 197, 194, 194),
              width: 5),
        ),
        child: const Center(
          child: SizedBox(
              height: 50,
              width: 80,
              child: Icon(
                size: 50,
                Icons.add,
                color: Color.fromARGB(255, 197, 194, 194),
              )),
        ));
  }
}
