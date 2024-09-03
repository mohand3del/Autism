

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_card_item.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';
import 'package:flutter/material.dart';

import 'cannel_builder.dart';
import 'channel_list_card_item.dart';

class ChannelViewBody extends StatelessWidget {
  const ChannelViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        const CustomBarBackArrow(title: "Channels",),
        verticalSpace(context.height*28/852),
        AppTextFormField(hintText: "Search", validator: (value){},prefixIcon: const Icon(Icons.search,size:30,color: Colors.grey),),
        verticalSpace(context.height*28/852),
        const ChannelBuilder()

      ],
    ));
  }
}
