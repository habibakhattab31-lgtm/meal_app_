import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro1/core/app_color.dart';
import 'package:pro1/features/screens/addMeal_screen.dart';
import 'package:pro1/features/screens/home_screen.dart';
import 'package:pro1/features/screens/profile_screen.dart';

class home_layout extends StatefulWidget {

  const home_layout({super.key});

  @override
  State<home_layout> createState() => _home_layoutState();

}

class _home_layoutState extends State<home_layout> {

  int currentIndex=0;
  List<Widget>screens=[
    const home_screen(),
    const addMeal_screen(),
    const profile_screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      backgroundColor: appColor.BackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appColor.secondaryColor,
        unselectedItemColor: appColor.BackgroundColor,
        selectedItemColor: appColor.primaryColor,
        currentIndex:currentIndex,
        onTap:(index){
          setState(() {
            currentIndex=index;

          });
        },
        items: [
        BottomNavigationBarItem(
          label: "home",
          activeIcon: SvgPicture.asset('assets/svg/home_active.svg'),
            icon: SvgPicture.asset('assets/svg/home.svg'),
            ),
        BottomNavigationBarItem(
          label: "Add_Meal",
            activeIcon: SvgPicture.asset('assets/svg/add_meal_active.svg'),
            icon: SvgPicture.asset('assets/svg/add_meal.svg')),
        BottomNavigationBarItem(
          label: "profile",
            activeIcon: SvgPicture.asset('assets/svg/profile_active.svg'),
            icon: SvgPicture.asset('assets/svg/profile.svg'))
      ],
      ),

    );
  }
}

