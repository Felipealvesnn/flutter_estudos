import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../data/store.dart';
import '../exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;
  DateTime? cd;
  Timer? _logouttime;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String get token {
    if (isAuth) {
      return _token!;
    }
    return '';
  }

  String get email {
    if (isAuth) {
      return _email!;
    }
    return '';
  }

  String get uid {
    if (isAuth) {
      return _uid!;
    }
    return '';
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDpT60mDasfPfAhNUFtrIKdmDcDiXFLYHI';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final responseBody = jsonDecode(response.body);
    if (responseBody['error'] != null) {
      throw auth_exception(responseBody['error']['message']);
    } else {
      _token = responseBody['idToken'];
      _email = responseBody['email'];
      _uid = responseBody['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody['expiresIn']),
        ),
      );
      Store.saveMap('userData', {
        'token': _token,
        'email': _email,
        'uid': _uid,
        'expiryDate': _expiryDate!.toIso8601String(),
      });

      _autoLogout();
      notifyListeners();
    }
    print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> logout() async {
    ;
    _token = null;
    _email = null;
    _uid = null;
    _expiryDate = null;
    Store.remove('userData').then((value) => notifyListeners());
  }

  void _clearTimer() {
    if (_logouttime != null) {
      _logouttime?.cancel();
      _logouttime = null;
    }
  }

  Future<void> tryAoutologin() async {
    if (isAuth) {
      return Future.value();
    }
    final userData = await Store.getMap('userData');

    if (userData.isEmpty) {
      return Future.value();
    }
    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return Future.value();
    }
    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['uid'];
    _expiryDate = expiryDate;
    _autoLogout();
    notifyListeners();
    return Future.value();
  }

  void _autoLogout() {
    _clearTimer();
    _logouttime = Timer(_expiryDate!.difference(DateTime.now()), logout);
  }
}
