import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/courses_screen.dart';
import './screens/my_courses_screen.dart';
import './widgets/bottom_nav_bar.dart';
import './screens/cart_screen.dart';
import 'Models/cart.dart';
import 'Models/orders.dart';
import './widgets/loading_spinner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProxyProvider<Cart, Orders>(
          create: (context)=>Orders([]),
          update: (ctx, cart, previousOrders) => Orders( previousOrders == null ? [] : previousOrders.orders),
        )
        ],
          child: MaterialApp(
        title: 'Extra Classes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: (CustomBottomNavigator()),
        routes: {
          CartScreen.routeName: ((context) => CartScreen()),
          CoursesScreen.routeName: ((context) => CoursesScreen()),
          MyCoursesScreen.routeName: ((context) => MyCoursesScreen())
        },
      ),
    );
  }
}
