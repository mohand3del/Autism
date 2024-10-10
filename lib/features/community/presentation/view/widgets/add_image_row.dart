

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class AddImageRow extends StatelessWidget {
  const AddImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/cameraPost.png'),
          horizontalSpace(context.width * 8 / 393),
          Image.asset('assets/images/galaryPost.png'),
        ],
      ),
    );
  }
}
