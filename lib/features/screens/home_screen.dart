import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro1/core/app_color.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int pageIndex= 0;
  List<String>images=[
    ("assets/pngs/first.png"),
    ("assets/pngs/second.png"),
    ("assets/pngs/third.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.BackgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height:400,
                  viewportFraction: 1,
                  disableCenter: true,
                onPageChanged: (index,reason){
                  debugPrint("on page index $index");
                  setState(() {
                    pageIndex=index;
                  });
                },
                   ), items:List.generate(images.length, (index) {
                     return Stack(
                       alignment: Alignment.center,
                       children: [
                         Image.asset(
                           images[index],
                           width: 1.sw,
                           height: 0.3.sh,
                           fit: BoxFit.cover,
                         ),
                         Positioned(
                             bottom:50.h,
                             child: DotsIndicator(
                             dotsCount: images.length,
                             position: pageIndex.toDouble(),
                             decorator: DotsDecorator(
                                 size:Size(20.w, 8.h),
                               shape: RoundedRectangleBorder(
                                 borderRadius:BorderRadius.circular(20.r),
                               ),
                               activeShape: RoundedRectangleBorder(
                               borderRadius:BorderRadius.circular(20.r),
                             ),
                               color: Colors.purple,
                               activeColor: Colors.brown,
                             ),
                               onTap: (index){
                                 pageIndex=index;
                               },
                         )
                         ),
                       ],
                     );
            }) ,

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("my Meal",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: ListTile(
                     leading: Image.asset("assets/pngs/JUICE.png",
                    width: 100.w,
                    height: 100.h,),
                     title:Text("BreakFast smoothie",style:
                     TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       subtitle:   Text("350 calories", style:
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                   )
                   ),
                 );
              }),
            )

          ],
        ),
      ),

    );
  }
}
