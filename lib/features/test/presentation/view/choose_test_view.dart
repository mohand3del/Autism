
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/test/presentation/view/widget/choose_test_method_body.dart';
import 'package:flutter/material.dart';

import 'widget/custom_test_app_bar.dart';

class ChooseTestView extends StatelessWidget {
  const ChooseTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title:"Mohand",),
      body: MethodSelectionPage(),
    );
  }
}
