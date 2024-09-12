import 'package:autism/core/routing/router.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CircularContainerWithImage extends StatelessWidget {
  final ImageProvider imageProvider;

  const CircularContainerWithImage({
    required this.imageProvider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:context.height * 180 / 852,
      width:context.width * 180 / 393,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:  const Color(0xff2B7FFD).withOpacity(0.15),
      ),
      child: Center(
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}