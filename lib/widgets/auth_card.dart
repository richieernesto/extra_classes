import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({ Key? key }) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 10.0,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(text: TextAlign.center),
                  labelText: 'Username/Email'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                obscureText: true,
              ),
              ElevatedButton(onPressed: (){}, child: Text("Sign In"))
            ]),
          ) ,
          ),
      ),
    );
  }
}