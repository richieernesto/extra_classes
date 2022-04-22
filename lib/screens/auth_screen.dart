import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/auth_card.dart';
import '../widgets/loading_spinner.dart';
import '../Models/auth.dart';
import '../Models/http_exception.dart';

enum AuthMode { SignIn, SignUp }

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(children: <Widget>[
        Container(
          child: Image.asset(
            'lib/assets/img/bgimage.jpg',
            fit: BoxFit.fitHeight,
          ),
          height: double.infinity,
          //  width: double.infinity,
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(35),
            child: AuthCard()),
        //LoadingScreen()
      ]),
    ));
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.SignIn;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  var _displaySnackBar = false;

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(message),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.SignIn) {
        //login
        String? mail;
        String? pass;
        if (_authData['email'] != null) {
          mail = _authData['email'];
        }
        if (_authData['email'] != null) {
          pass = _authData['password'];
        }
        await Provider.of<Auth>(context, listen: false).login(mail!, pass!);
      } else {
        String? mail;
        String? pass;
        if (_authData['email'] != null) {
          mail = _authData['email'];
        }
        if (_authData['email'] != null) {
          pass = _authData['password'];
        }
        await Provider.of<Auth>(context, listen: false).signUp(
          mail!,
          pass!,
        );
      }
      //instead of using the usual catch, on HttpException is used because we want to handle our own exception
      //or filter what we catch
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = "Email Already Exists!";
      } else if (error.toString().contains("INVALID_EMAIL")) {
        errorMessage = "Email is not valid";
      } else if (error.toString().contains("WEAK_PASSWORD")) {
        errorMessage = "Password is weak!";
      } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
        errorMessage = "Could not Find a user with this email";
      } else if (error.toString().contains("INVALID_PASSWORD")) {
        errorMessage = "Password is not correct";
      }
      _showErrorDialog(errorMessage);
      //Navigator.of(context).pushReplacement('./courses_screen')
    } catch (error) {
      var errorMessage = 'Could not Authenticate you. Please Try Again Later!';
      _showErrorDialog(errorMessage);
    }
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Account to be created",
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
      ),
    );
    setState(() {
      _isLoading = false;
      _emailController.clear();
      _passwordController.clear();
      _authMode = AuthMode.SignIn;
      //This is to minimize the keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      if (_displaySnackBar = false) {
        _displaySnackBar = true;
      }
    });
  }

  void _setAuthMode() {
    if (_authMode == AuthMode.SignIn) {
      setState(() {
        //print(authMode);
        _authMode = AuthMode.SignUp;
        print(_authMode);
      });
    } else {
      setState(() {
        //print(authMode);
        _authMode = AuthMode.SignIn;
        print(_authMode);
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
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty || !value!.contains('@')) {
                  return 'Invalid email!';
                }
                //return null;
                //return null;
              },
              onSaved: (value) {
                _authData['email'] = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty || value.length < 5) {
                  return "Password is short";
                }
              },
              onSaved: (value) {
                _authData['password'] = value!;
              },
            ),
            //This TextField should only be displayed when the user taps on sign up instead otherwise do not
            _authMode == AuthMode.SignUp
                ? TextFormField(
                    //enabled: authMode = true,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                    ),
                    obscureText: true,
                    validator: _authMode == AuthMode.SignUp
                        ? (value) {
                            if (value != _passwordController.text) {
                              return "Paswords do not match!";
                            }
                          }
                        : null,
                  )
                : Container(),
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpinKitDualRing(
                      color: Colors.blue,
                      size: 30,
                    ),
                  )
                : ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                        _authMode == AuthMode.SignIn ? "Sign In" : "Sign Up")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: _setAuthMode,
                  child: Text(
                      _authMode == AuthMode.SignIn
                          ? "Sign up Instead"
                          : "Sign In",
                      style: TextStyle(
                        color: Colors.red,
                      )),
                ),

                SizedBox(width: 15),
                //ElevatedButton(onPressed: (){}, child: Text("Submit"))
              ],
            ),
          ]),
          //_displaySnackBar? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created Successfuly! Log in now"))): Container();
        ),
      ),
    ));
  }
}
