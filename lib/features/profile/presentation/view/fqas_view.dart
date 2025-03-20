import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/fqas_view_body.dart';

class FqasView extends StatelessWidget {
  const FqasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white, body: FqasViewBody());
  }
}
