import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(padding: EdgeInsets.only(top: context.height * 0.095,left: context.width *0.063 ),
          child: Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}
