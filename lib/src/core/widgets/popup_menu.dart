import 'dart:io';

import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/result_search_or_category/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  maxCost,
  minCost,
  alphabetAZ,
  alphabetZA,
  startNew,
  startOld,
  hits
}

extension ParseToString on FilterOptions {
  String toShortString() {
    return toString().split('.').last;
  }
}

showPopupMenu(BuildContext context, Offset offset, Function(FilterOptions) callback) {
  double top = offset.dy;
  showMenu<FilterOptions>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    context: context,
    position: RelativeRect.fromLTRB(0, top - 20, 0, 0),
    items: [
      const PopupMenuItem(
        value: FilterOptions.maxCost,
        child: Text('По цене макс'),
      ),
      const PopupMenuItem(
        value: FilterOptions.minCost,
        child: Text('По цене мин'),
      ),
      const PopupMenuItem(
        value: FilterOptions.alphabetAZ,
        child: Text('По алфавиту А-я'),
      ),
      const PopupMenuItem(
        value: FilterOptions.alphabetZA,
        child: Text('По алфавиту Я-а'),
      ),
      const PopupMenuItem(
        value: FilterOptions.startNew,
        child: Text('Сначала новые'),
      ),
      const PopupMenuItem(
        value: FilterOptions.startOld,
        child: Text('Сначала старые'),
      ),
      const PopupMenuItem(
        value: FilterOptions.hits,
        child: Text('Хит продаж'),
      ),
    ],
    elevation: 8.0,
  ).then<void>((options) {
    if (options != null) callback(options);
  });
}

void customDialog(
  BuildContext context,
  Function positivCallback, {
  String subject = '',
  String leftAnswer = 'да',
  String rightAnswer = 'нет',
}) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        //this right here
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 150.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                subject,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextButton(
                    onPressed: () {
                      positivCallback();
                      Navigator.pop(context);
                    },
                    child: Text(leftAnswer, style: const TextStyle(color: secondaryGray),)),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(rightAnswer,style: const TextStyle(color: green)),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  } else {
    showCupertinoDialog(
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(subject),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    positivCallback();
                    Navigator.pop(context);
                  },
                  child: Text(leftAnswer),
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: Text(rightAnswer),
                ),
              ],
            ),
        context: context);
  }
}
