
import 'package:flutter/material.dart';

class UsersCourses extends StatelessWidget {
  const UsersCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 80,
      child: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: const Image(
                    image: AssetImage('assets/poland.png'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
