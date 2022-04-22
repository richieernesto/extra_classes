import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryToken;
  String? user_Id;

  //Auth(this._token, this._expiryToken, this.user_Id);

  //this is what activates page redirection in main.dart
  bool get isAuth {
    return _token != null;
  }

  //String to get the token
  String? get token {
    if (_expiryToken != null &&
        _expiryToken!.isAfter(DateTime.now()) &&
        _token != null) {
      return token;
    }
    return null;
  }

  Future<void> signUp(String email, String password) async {
    try {
      Uri url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCxmJ-9qiP2Eh3tSFLSPJUAfRkHi1O0wKc');
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true
          }));
      //To verify if sign up worked
      //print(json.decode(response.body).toString());
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      user_Id = responseData['localId'];
      _expiryToken = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
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
    final responseData = json.decode(response.body);
    try {
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      user_Id = responseData['localId'];
      _expiryToken = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
