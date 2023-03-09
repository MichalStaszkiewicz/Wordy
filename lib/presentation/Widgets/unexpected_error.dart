
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/shared/consts.dart';

class UnexpectedError extends StatelessWidget {
UnexpectedError();

  @override
  Widget build(BuildContext context) {
    return  Consumer<InterfaceDataProvider>(builder: (context,value,child)=>Center(
        child: Text(ui_lang[value.interfaceLangauge]!['unexpected_error'].toString()),
      ),
     
    );
  }
}
