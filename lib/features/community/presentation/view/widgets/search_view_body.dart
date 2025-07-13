import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

import 'search_form_text_field.dart';
import 'search_history_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        verticalSpace(context.height * 27 / 852),
        const SearchFormTextField(),
        const SearchHistoryListView(),

      ],
    ));
  }
}
