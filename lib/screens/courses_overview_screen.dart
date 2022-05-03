import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/courses_grid.dart';
import '../widgets/app_bar_search.dart';
import '../widgets/menu_button.dart';
import '../Models/course_products.dart';

class CoursesOverview extends StatefulWidget {
  //const CoursesOverview({Key? key}) : super(key: key);
  static const routeName = "./CoursesOverview";

  @override
  State<CoursesOverview> createState() => _CoursesOverviewState();
}

class _CoursesOverviewState extends State<CoursesOverview> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ChangeNotifierProvider(
        create: (context) => CourseProducts(),
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(55), child: CustomAppBar()),
          drawer: MenuButton(),
          body: CourseGrid(),
        ),
      ),
    );
  }
}
