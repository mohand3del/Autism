


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(

      children: [
        Padding(
          padding: EdgeInsets.only(
            top: height * 0.095,
            left: width * 0.063,
          ),
          child: InkWell(
            onTap: () {
              if (context.canPop()) {context.pop();
              } else {

                context.go('/login');
              }
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ],
    );
  }
}
