

import 'dart:async';


import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/features/splash/presentation/view/widget/animated_autism.dart';
import 'package:autism/features/splash/presentation/view/widget/animated_logo.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat animation with reverse

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    //Navigate to HomeScreen after 2 seconds
    Timer(const Duration(seconds: 3), () async {

      if(await SharedPrefHelper.getOnBoardingScreenViewed()){
        if(SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)!=null){
         // Navigator.pushReplacementNamed(context, Routes.layout);
          context.go('/home');

        }else{
         // Navigator.pushReplacementNamed(context, Routes.login);
          context.go('/login');
        }
      }else{
       // Navigator.pushReplacementNamed(context, Routes.onBoarding);
        context.go('/onboarding');
      }










      //context.go('/onboarding');
      //context.go('/newPassword');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          AnimatedLogo(controller: _controller, fadeAnimation: _fadeAnimation, scaleAnimation: _scaleAnimation,),

          AnimatedAutism(controller: _controller, fadeAnimation: _fadeAnimation, scaleAnimation: _scaleAnimation)

        ],
      ),
    );
  }
}







