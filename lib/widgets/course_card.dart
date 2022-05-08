import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/course.dart';
import '../screens/More_Info_Screen.dart';
import '../screens/course_info.dart';

class CourseCard extends StatelessWidget {
  //const CourseCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final course = Provider.of<Course>(context, listen: false);
    return SizedBox(
      //height: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => CourseInfoScreen(
                    description: course.description,
                    product_title: course.title,
                    price: course.price,
                    thumbnail_url: course.thumbnail,
                  ))));
        },
        child: SizedBox(
          //height: 200,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child: Image.network(
                        course.thumbnail,
                        fit: BoxFit.fill,
                      ),
                      width: 150,
                      height: 130),
                  //height: 55,
                  //width: 120,
                ),
                Text(
                  course.nametutor,
                  style: const TextStyle(fontSize: 8),
                  textAlign: TextAlign.center,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${course.title} \n ${course.grade_or_class}",
                      style: TextStyle(),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                    //Text(course.grade_or_class),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "\$${course.price}",
                        textAlign: TextAlign.right,
                      ),
                    ),
                    //Text("\n"),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
