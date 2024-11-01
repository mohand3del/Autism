import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key,
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
      child:Image.asset("assets/images/logo.png",width: width*0.4,height: height*0.258,),
    );
  }
}