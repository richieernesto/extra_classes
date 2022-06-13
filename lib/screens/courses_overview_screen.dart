import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/courses_grid.dart';
import '../widgets/app_bar_search.dart';
import '../widgets/menu_button.dart';
import '../Models/course_products.dart';
import '../widgets/course_card.dart';
import '../widgets/popular_courses.dart';

class CoursesOverview extends StatefulWidget {
  //const CoursesOverview({Key? key}) : super(key: key);
  static const routeName = "./CoursesOverview";

  @override
  State<CoursesOverview> createState() => _CoursesOverviewState();
}

class _CoursesOverviewState extends State<CoursesOverview> {
  @override
  Widget build(BuildContext context) {
    // final loadedCourseData =
    //     Provider.of<CourseProducts>(context, listen: false);
    // final loadedCourses = loadedCourseData.items;
    return WillPopScope(
      onWillPop: () async => false,
      child: ChangeNotifierProvider(
        create: (context) => CourseProducts(),
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(55), child: CustomAppBar()),
          drawer: MenuButton(),
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            //height: 400,
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    "Welcome to Extra Classes!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                //Spacer(),
                Text(
                  "Great subjects for your Kids",
                  textAlign: TextAlign.center,
                ),
                //Spacer(),
                Container(
                  child: CourseGrid(),
                  //height: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
