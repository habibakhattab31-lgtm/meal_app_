import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro1/core/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro1/home/home_layout.dart';

import '../../core/constant.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<String> titles = [
    "save_your_meals_ingredient",
    "use_our_app_the_best_choice",
    "our_app_your_ultimate_choice",
  ];

  List<String> subtitles = [
    "add_your_meals_and_its_ingredients_and_we_will_save_it_for_you",
    "the_best_choice_for_your_kitchen_do_not_hesitate",
    "all_the_best_restaurants_and_their_top_menus_are_ready_for_you",
  ];

  int pageIndex = 0;

  final CarouselSliderController sliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    print('------build------');

    final screenSize = MediaQuery.sizeOf(context);
    var changeLanguage;
    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/pngs/img.png'), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 30.h,
              left: 30.w,
              right: 30.w,
              child: Container(
                width: 311.w,
                height: 400.h,
                decoration: BoxDecoration(
                    color: appColor.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: sliderController,
                      options: CarouselOptions(
                        height: 300.h,
                        disableCenter: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          debugPrint('my page index: $index');
                          setState(() {
                            pageIndex = index;
                          });
                        },
                      ),
                      items: List.generate(
                        subtitles.length,
                            (index) {
                          return Column(
                            children: [
                              SizedBox(height: 20.h),
                              Text(
                                titles[index].tr(),
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: appColor.BackgroundColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                subtitles[index].tr(),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: appColor.BackgroundColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30.h),
                              DotsIndicator(
                                dotsCount: titles.length,
                                position: pageIndex.toDouble(),
                                onTap: (index) {
                                  sliderController.animateToPage(index);
                                },
                                decorator: DotsDecorator(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  size: Size(10.w, 8.h),
                                  activeColor: appColor.secondaryColor,
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)
                                  )
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    pageIndex!=2?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed:() async{
                          final SharedPreferences pref =await SharedPreferences.getInstance();
                          await pref.setBool(ISFIRSTTIME, true);
                          Navigator.pushReplacementNamed(context, Home_layout);
                        },
                        child:
                        Text("skip".tr(),
                        style: TextStyle(
                          fontSize:30.sp,
                          fontWeight: FontWeight.bold,
                        ),)),
                        TextButton(onPressed:
                            sliderController.nextPage
                            , child: Text("next".tr(), style: TextStyle(
                              fontSize:30.sp,
                              fontWeight: FontWeight.bold,
                            ),)
                        )
                      ],
                    ):GestureDetector(
                      onTap: () async{
                        setState(() async {
                          final SharedPreferences prefs =await SharedPreferences.getInstance();
                          await prefs.setBool(ISFIRSTTIME, true);
                          Navigator.pushReplacementNamed(context, Home_layout);
                        });

                      },
                      child: CircleAvatar(
                        backgroundColor: appColor.BackgroundColor,
                        radius: 30.r,
                        child: Icon(Icons.arrow_forward),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeLanguage),
    );
  }
}
