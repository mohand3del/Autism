

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_search_row.dart';
import 'package:flutter/material.dart';


import 'explore_list_bloc_builder.dart';


class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const CustomBarBackArrow(title: "Explore",),
          verticalSpace(context.height*28/852),
         const CustomSearchRow(),
          verticalSpace(context.height*28/852),
          Expanded(child: const ExploreListBlocBuilder()),

        ],
      ),
    );
  }

}
