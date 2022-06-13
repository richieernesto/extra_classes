import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/course_products.dart';
import './course_card.dart';
import '../screens/course_info.dart';
import '../Models/course.dart';
import './popular_courses.dart';

class CourseGrid extends StatelessWidget {
  //const CourseGrid({ Key? key }) : super(key: key);
  // final List loadedCourses;

  // const CourseGrid({Key? key, required this.loadedCourses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedCourseData =
        Provider.of<CourseProducts>(context, listen: false);
    final loadedCourses = loadedCourseData.items;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 500,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    //flex: 3,
                    child: ListView.builder(
                      //padding: const EdgeInsets.all(2),
                      itemCount: loadedCourses.length,
                      itemBuilder: (context, i) => ChangeNotifierProvider.value(
                        value: loadedCourses[i],
                        child: CourseCard(),
                      ),
                      scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                    ),
                  ),
                  Text(
                    "Popular Courses",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        child: ListView.builder(
                          itemCount: loadedCourses.length,
                          itemBuilder: (context, i) =>
                              ChangeNotifierProvider.value(
                            value: loadedCourses[i],
                            child: PopularCourses(),
                          ),
                        ),
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
