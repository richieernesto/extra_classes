import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryToken;
  late String user_Id;

  //Auth(this._token, this._expiryToken, this.user_Id);

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCxmJ-9qiP2Eh3tSFLSPJUAfRkHi1O0wKc');
    final response = await http.post(url,
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
    //To verify if sign up worked
    print(json.decode(response.body).toString());
  }

  Future<void> signUp(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCxmJ-9qiP2Eh3tSFLSPJUAfRkHi1O0wKc');
    final response = await http.post(url,
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
    //To verify if sign up worked
    print(json.decode(response.body).toString());
  }

  Future<void> login(String email, String password) async {
    //The Function was not just called but rather the return statement was added to allow the loading spinner to work
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCxmJ-9qiP2Eh3tSFLSPJUAfRkHi1O0wKc');
    final response = await http.post(url,
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
    //To verify if sign up worked
    print(json.decode(response.body).toString());
  }
}
