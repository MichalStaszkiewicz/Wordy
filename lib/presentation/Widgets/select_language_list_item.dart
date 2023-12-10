import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/global/courses_lang_interface.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

class SelectLanguageListItem extends StatefulWidget {
  SelectLanguageListItem(
      {required this.image,
      required this.label,
      required this.isListExpanded,
      required this.itemIndex});
  String image;

  String label;
  bool isListExpanded;
  int itemIndex;
  @override
  State<SelectLanguageListItem> createState() => _SelectLanguageListItemState();
}

class _SelectLanguageListItemState extends State<SelectLanguageListItem>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  var forward = false;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (widget.itemIndex + 1) * 300));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isListExpanded == true && forward == false) {
      controller.forward();

      forward = true;
    } else if (forward == true && widget.isListExpanded == false) {
      controller.reverse();
      forward = false;
    }
    return Opacity(
      opacity: animation.value,
      child: Consumer<CoursesLangInterface>(
        builder: (context, model, child) => GestureDetector(
          onTap: () {
            if (locator<GlobalDataManager>().interfaceLanguage.toLowerCase() ==
                widget.label.toLowerCase()) {
              model.setIsExpanded();
            } else {
              locator<DialogManager>().showQuestionDialog(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'asking_for_change_interface_language'],
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'messages']['are_you_sure'],
                  context, () {
                model.setIsExpanded();
                context
                    .read<CoursesUpdateBloc>()
                    .add(SwitchInterfaceLanguage(languageName: widget.label));
              }, () {
                model.setIsExpanded();
              });
            }
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 35,
                  child: Image.network(locator<Urls>().imageUrl + widget.image),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
