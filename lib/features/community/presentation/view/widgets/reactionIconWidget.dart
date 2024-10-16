import 'package:flutter/material.dart';

class ReactionIcon extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;

  const ReactionIcon({super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Image(
          image: image,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}