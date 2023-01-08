import 'dart:io';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/features/auth/service/auth_service.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/auth/login_request.dart';
import 'package:appointments/models/auth/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  String? message;

  AuthService _service = AuthService();
  login(String email, String password, bool saveToken, context) async {
    try {
      final request = LogInRequest(email: email, password: password);
      final success = await _service.login(request);
      message = _service.message;
      if (success && saveToken) {
        if (saveToken) {
          await locator.get<LocalRepo>().saveToken(_service.token!);
          // /await Provider.of<UserProvider>(context, listen: false).getProfile();
          await locator.get<LocalRepo>().getToken();
        } else {
          locator.get<LocalRepo>().vartoken(_service.token!);
        }
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  register(String name, String email, String password, String role,
      {File? image,
      String? address,
      String? number,
      String? category,
      String? spec}) async {
    final user = UserModel(
        id: DateTime.now().millisecond,
        name: name,
        email: email,
        password: password,
        role: role,
        address: address,
        Phone_Number: number,
        Category: category,
        specialization: spec,
        balance: 0);
    final success = await _service.register(user, image: image);
    print(success);
    message = _service.message;
    return success;
  }

  logOut() async {
    final _localService = LocalRepo();
    locator.get<LocalRepo>().token = null;
    return await _localService.clear();
  }
}
