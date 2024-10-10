import 'package:autism/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TipsContainer extends StatelessWidget {
  final List<String> tips;

  const TipsContainer({required this.tips, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff2B7FFD).withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tips.map((tip) {
          return Text(
            tip,
            style: AppStyles.regular18(context).copyWith(
              fontFamily: 'Poppins',
              color: const Color(0xff828A97),
            ),
          );
        }).toList(),
      ),
    );
  }
}