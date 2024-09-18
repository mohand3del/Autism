

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_bar_back_arrow.dart';
import 'history/history_bloc_builder.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomBarBackArrow(title: "History", icon: FontAwesomeIcons.trashCan, ),
          verticalSpace(context.height*24/852),
          Expanded(child: HistoryBlocBuilder()),


        ],
      ),
    );
  }
}
