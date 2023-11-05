import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

class SelectedLangaugeItem extends StatefulWidget {
   SelectedLangaugeItem({required this.image, required this.label});
  String image;
  String label;
  @override
  State<SelectedLangaugeItem> createState() => _SelectedLangaugeItemState();
}

class _SelectedLangaugeItemState extends State<SelectedLangaugeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 35,
            child: Image.network(Urls.kImageUrl + widget.image),
          ),
          Text(
              translate[locator<GlobalDataManager>().interfaceLanguage]![
                  widget.label],
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
          Container(
            width: 20,
            child: Icon(Icons.arrow_downward),
          )
        ],
      ),
    );
  }
}
