import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/contact_view_body.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white, body: ContactViewBody());
  }
}
