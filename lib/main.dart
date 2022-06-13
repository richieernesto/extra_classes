import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Extra Class Tutor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot){
            if(userSnapshot.hasData){
            return CustomBottomNavigator();
          }
          return AuthScreen();
          },
        ),
      );
  }}