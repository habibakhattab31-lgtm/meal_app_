import 'package:flutter/material.dart';
class habiba extends StatelessWidget {
  const habiba({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white30,
        appBar:
        AppBar(
          backgroundColor: Colors.blue,
          title: Text("PROFILE",
            style: TextStyle(color: Colors.purple,fontSize: 40,fontWeight: FontWeight.bold),

          ),
          centerTitle: true,
        ),
        body:
        Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 280,
                child: ClipRRect
                  (borderRadius: BorderRadius.circular(70),
                  child: Image.asset("assets/images/17539978950211.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text("habiba khattab",style: TextStyle(fontSize: 40,color:  Colors.blue),),
            SizedBox(height: 15,),
            Text("Mobile App Developer",
              style: TextStyle(fontSize: 20,color:  Colors.blue),),
            SizedBox(height: 20,),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: [
                  Icon(Icons.call,color: Colors.blue,size: 40,),
                  SizedBox(width: 75,),
                  Text("01141046714",style: TextStyle(fontSize: 27,color: Colors.black),),

                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  color:Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: [
                  Icon(Icons.mail,size: 40,color: Colors.blue,),
                  SizedBox(width: 30,),
                  Text("habibakhattab@gmail.com",style: TextStyle(fontSize: 20,color: Colors.black),)
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
