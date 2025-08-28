import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:pro1/core/app_color.dart';
import 'package:pro1/home/data/meal_model.dart';
import 'package:pro1/home/data/dp_healper.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              child: FutureBuilder(
                future:DatabaseHelper.instance.getMeals() ,
                builder: (context ,Snapshot){
                  if(Snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if (Snapshot.hasData){
                    log('has data');
                    if(Snapshot.data!.isEmpty){
                      return Center(child: Text("no data "),);
                    }
                    return ListView.builder(
                      itemCount: Snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = Snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: item.imageUrl,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              item.calories.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  else if (Snapshot.hasError){
                    return Text("there is no data ");
                  }
                  return SizedBox();
                },
              ),
            )

          ],
        ),
      ),

    );
  }
}
