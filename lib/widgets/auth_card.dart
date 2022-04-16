import 'package:flutter/material.dart';

enum AuthMode { SignIn, SignUp }

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode authMode = AuthMode.SignIn;

  void _setAuthMode() {
    if (authMode == AuthMode.SignIn) {
      setState(() {
        //print(authMode);
        authMode = AuthMode.SignUp;
        print(authMode);
      });
    } else {
      setState(() {
        //print(authMode);
        authMode = AuthMode.SignIn;
        print(authMode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  //labelStyle: TextStyle(text: TextAlign.center),
                  labelText: 'Username/Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            authMode == AuthMode.SignUp
                ? TextFormField(
                    //enabled: authMode = true,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                    ),
                    obscureText: true,
                  )
                : Container(),
            ElevatedButton(onPressed: _setAuthMode, child: Text("Sign In")),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: _setAuthMode,
                  child: Text("Sign Up",
                      style: TextStyle(
                        color: Colors.red,
                      )),
                ),
                SizedBox(width:15),
                ElevatedButton(onPressed: (){}, child: Text("Submit"))
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
