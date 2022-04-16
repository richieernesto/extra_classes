import 'package:flutter/material.dart';
import '../widgets/auth_card.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
              child: Stack(
          children: <Widget> [
            Container(
              child: Image.asset('lib/assets/img/bgimage.jpg', fit: BoxFit.fitHeight,),
             height: double.infinity,
            //  width: double.infinity,
              
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(35),
                  child: AuthCard()),
          ]
        ),
      )
      
    );
  }
}