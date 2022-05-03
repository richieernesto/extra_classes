import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/course_products.dart';

class MoreInfoScreen extends StatelessWidget {
  final String product_title;
  final String thumbnail_url;
  final double price;
  final String description;
  //const MoreInfoScreen({Key? key}) : super(key: key);
  static const routeName = "./more_info_screen";

  MoreInfoScreen(
      {required this.product_title,
      required this.price,
      required this.thumbnail_url,
      required this.description});

  @override
  Widget build(BuildContext context) {
    /* final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<CourseProducts>(context, listen: false).findById(productId); */
    return Scaffold(
      appBar: AppBar(
        title: Text(product_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                thumbnail_url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
