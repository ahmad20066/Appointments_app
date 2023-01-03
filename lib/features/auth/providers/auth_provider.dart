import 'dart:io';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/features/auth/service/auth_service.dart';
import 'package:appointments/models/auth/login_request.dart';
import 'package:appointments/models/auth/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String? message;
  AuthService _service = AuthService();
  login(String email, String password) async {
    final request = LogInRequest(email: email, password: password);
    final success = await _service.login(request);
    message = _service.message;
    if (success) {
      final _localService = LocalRepo();
      await _localService.saveToken(_service.token!);

      print(await _localService.getToken());
    }
    return success;
  }

  register(String name, String email, String password, String role,
      {File? image, String? address, String? number, String? category}) async {
    final user = UserModel(
        name: name,
        email: email,
        password: password,
        role: role,
        address: address,
        Phone_Number: number);
    final success = await _service.register(user, image: image);
    if (success) {
      login(email, password);
    }
    return success;
  }

  logOut() async {
    final _localService = LocalRepo();
    await _localService.clear();
  }
}
