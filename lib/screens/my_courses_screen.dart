import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/app_bar.dart';
import '../screens/cart_screen.dart';
// my courses my_courses_screen.dart
class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);
  static const routeName = "/my_courses_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(Icons.shopping_cart))
      ]),
      drawer: MenuButton(),
      body:Container(
         child: Column(
          children: [
            ListView(
              scrollDirection:Axis.horizontal,
              children: [
                Container(
                  color: Colors.blue,
                  child:Column(children: [
                    Container(
                      color:Colors.red
                    )
                  ],)
                )
              ],
            )

        ],),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }
}
