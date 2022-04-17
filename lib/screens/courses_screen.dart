import 'package:extra_classes/Models/courses_container.dart';
import 'package:extra_classes/screens/More_Info_Screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

import '../widgets/app_bar_search.dart';

//Home is courses_screen.dart
class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);
  static const routeName = "./courses_screen";

  final String imageDirectory = "lib/assets/img/bgimage.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55), child: CustomAppBar()),
      drawer: MenuButton(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text("What would like to find?",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:16.0,right:16.0,top:8.0,bottom:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mathematics courses",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                //first container for courses
                Container(
                  height: 300.0,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        //second parent container
                        //the bottom text container
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                           onTap: ()=> Navigator.push(context, MaterialPageRoute(
                             builder: (_)=> MoreInfoScreen(image: AssetImage(imageDirectory))
                           
                           )),
                             child: Container(
                              margin: EdgeInsets.all(10.0),
                              width: 210.0,
                              color: Colors.white10,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Positioned(
                                    bottom: 5.0,
                                    child: Container(
                                      height: 120.0,
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(10.0, 5.0),
                                            blurRadius: 10.0,
                                          )
                                        ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                        
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tutor's Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.0),
                                            ),
                                            Text(
                                              "School of Tutor",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            Text(
                                              "“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(10.0, 5.0),
                                            blurRadius: 10.0,
                                          )
                                        ]),
                                    child: Stack(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image(
                                            height: 180,
                                            width: 180,
                                            image: AssetImage(
                                                "lib/assets/img/bgimage.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        //Price stated here
                                        Positioned(
                                          left: 10.0,
                                          bottom: 10.0,
                                         child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget> [
                                              Text("\$ Price",style: TextStyle(color:Colors.white,fontSize: 12.0)
                                              ,),
        
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
                

              ],
            ),
          CoursesContainer(),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }
}
