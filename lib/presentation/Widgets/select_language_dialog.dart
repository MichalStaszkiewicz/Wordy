import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/language.dart';

class LanguageDialog extends StatelessWidget {
  LanguageDialog();
  final List<Language> _languages = [
    Language(
      image: "assets/poland.png",
      label: "Polish",
      selected: true,
    ),
    Language(
        image: "assets/united-kingdom.png", label: "English", selected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: const Text(
                    "Select Interface Language",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image(
                          image: AssetImage(_languages[index].image),
                        ),
                        title: Text(_languages[index].label),
                        trailing: true == _languages[index].selected
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
