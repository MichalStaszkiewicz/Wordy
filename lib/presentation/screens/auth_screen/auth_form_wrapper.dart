import 'package:flutter/material.dart';

class AuthFormWrapper extends StatefulWidget {
  AuthFormWrapper({required this.child});
  Widget child;
  @override
  State<AuthFormWrapper> createState() => _AuthFormWrapperState();
}

class _AuthFormWrapperState extends State<AuthFormWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
                alignment: Alignment.center,
                child: Container(
                    height: 450,
                    width: 350,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: widget.child)),
          )
        ],
      )),
    );
  }
}
