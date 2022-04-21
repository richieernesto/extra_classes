import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  late String _token;
  late DateTime _expiryToken;
  late String user_Id;

  //Auth(this._token, this._expiryToken, this.user_Id);

  Future <void> signUp(String email, String password)async{
    Uri url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCxmJ-9qiP2Eh3tSFLSPJUAfRkHi1O0wKc');
    final response =await http.post(url, body: json.encode({
      "email": email,
      "password": password,
      "returnSecureToken": true
    }) );
    //To verify if sign up worked 
    print (json.decode(response.body));
  }
}