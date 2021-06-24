import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext pContext, UserModel? pUser) {
    if (pUser != null) {
      saveUser(pUser);
      _user = pUser;
      Navigator.pushReplacementNamed(pContext, "/home");
    } else {
      Navigator.pushReplacementNamed(pContext, "/login");
    }
  }

  Future<void> saveUser(UserModel pUser) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', pUser.toJSON());
    return;
  }

  Future<void> currentUser(BuildContext pContext) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey('user')) {
      final json = instance.get('user') as String;
      setUser(pContext, UserModel.fromJson(json));
      return;
    } else {
      setUser(pContext, null);
    }
  }
}
