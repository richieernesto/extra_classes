import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/courses_overview_screen.dart';
import './screens/my_courses_screen.dart';
import './screens/More_Info_Screen.dart';
import './widgets/bottom_nav_bar.dart';
import './screens/cart_screen.dart';
import 'Models/cart.dart';
import 'Models/orders.dart';
import './widgets/loading_spinner.dart';
import 'Models/auth.dart';
import './Models/course.dart';
import 'Models/course_products.dart ';

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
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProvider.value(value: CourseProducts()),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProxyProvider<Cart, Orders>(
            create: (context) => Orders([]),
            update: (ctx, cart, previousOrders) =>
                Orders(previousOrders == null ? [] : previousOrders.orders),
          )
        ],
        //Consumer is used so that all of the MyApp is not rebuilt
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
              title: 'Extra Classes',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
                // pageTransitionsTheme: PageTransitionsTheme(builders: {
                //   TargetPlatform.android: CustomPageTransitionBuilder(),
                //   TargetPlatform.iOS : CustomPageTransitionBuilder()
                // })
              ),
              home: auth.isAuth ? CustomBottomNavigator() : AuthScreen(),
              routes: {
                CustomBottomNavigator.routeName: ((context) =>
                    CustomBottomNavigator()),
                CartScreen.routeName: ((context) => CartScreen()),
                CoursesOverview.routeName: ((context) => CoursesOverview()),
                MyCoursesScreen.routeName: ((context) => MyCoursesScreen()),
                //MoreInfoScreen.routeName: ((context) => MoreInfoScreen())
              }),
        ));
  }
}
