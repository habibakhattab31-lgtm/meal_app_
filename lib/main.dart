import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro1/features/onboarding/onboarding_screen.dart';
import 'package:pro1/features/onboarding/splash_screen.dart';
import 'package:pro1/habiba.dart';
import 'package:pro1/home/home_layout.dart';
import 'package:pro1/core/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: splashRoute,
          routes: {
            splashRoute: (context) => const splash(),
            onboardingRoute: (context) => const Onboarding(),
            homeRoute: (context) => const home_layout(),
          },

        );
      },
    );
  }
}


