import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedAutism extends StatelessWidget {
  const AnimatedAutism({super.key,
    required AnimationController controller,
    required Animation<double> fadeAnimation,
    required Animation<double> scaleAnimation,}):
        _controller = controller,
        _fadeAnimation = fadeAnimation,
        _scaleAnimation = scaleAnimation;

  final AnimationController _controller;
  final Animation<double> _fadeAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation:_controller, builder: (context, child) {
      return  Opacity(
        opacity: _fadeAnimation.value,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
      );
    },
      child:    SvgPicture.asset("assets/images/Autism.svg",
        //width: width*0.61,
        height: height*0.047,),

    );
  }
}