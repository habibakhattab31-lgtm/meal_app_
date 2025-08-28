import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro1/core/app_color.dart';
import 'package:pro1/features/onboarding/onboarding_screen.dart';
import 'package:pro1/home/home_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/features/onboarding/splash_screen.dart';
import 'package:pro1/core/constant.dart';
import 'package:lottie/lottie.dart';


class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds:10),(){ checkOnboarding();});

  }


  Future<void> checkOnboarding()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool isFirstTime = pref.getBool(ISFIRSTTIME)?? false;

    if (isFirstTime){
      Navigator.pushReplacementNamed(context,homeRoute);

    }else
    {
      Navigator.pushReplacementNamed(context,onboardingRoute );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.BackgroundColor,
      body: Center(
        child: Lottie.asset(
            'assets/lottie/animation.json',
          width: 400.w,
          height: 400.h,
          fit: BoxFit.contain,
        ),
      ),

    );
  }
}
