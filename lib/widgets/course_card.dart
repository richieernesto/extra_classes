import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/course.dart';
import '../screens/More_Info_Screen.dart';

class CourseCard extends StatelessWidget {
  //const CourseCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final course = Provider.of<Course>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MoreInfoScreen(
                      product_title: course.title,
                      price: course.price,
                      description: course.description,
                      thumbnail_url: course.thumbnail,
                    )));
          },
          child: Image.network(
            course.thumbnail,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Container(),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
