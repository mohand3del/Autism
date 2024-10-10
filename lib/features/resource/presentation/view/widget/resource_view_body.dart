
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/resource/presentation/view/widget/resource_bloc_builder.dart';
import 'package:autism/features/test/presentation/view/widget/custom_test_app_bar.dart';
import 'package:flutter/material.dart';


class ResourceViewBody extends StatelessWidget {
  const ResourceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(title:"Mohand",),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        verticalSpace(context.height * 20 / 851),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text("Articles", style:AppStyles.medium20(context).copyWith(
            color: Colors.black,
            fontFamily: "Poppins",
          )),
        ),
        verticalSpace(context.height * 10 / 851),
        const ResourceBlocBuilder()

      ],
    ));
  }
}
