import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/course_products.dart';
import './course_card.dart';

class CourseGrid extends StatelessWidget {
  //const CourseGrid({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedCourseData =
        Provider.of<CourseProducts>(context, listen: false);
    final loadedCourses = loadedCourseData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedCourses.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedCourses[i],
        child: CourseCard(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
