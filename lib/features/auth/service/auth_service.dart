import 'dart:convert';
import 'dart:io';

import 'package:appointments/constants/end_points.dart';
import 'package:appointments/models/auth/login_request.dart';
import 'package:appointments/models/auth/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String message = 'Error';
  String? token;
  Future login(LogInRequest request) async {
    try {
      final url = Uri.parse(EndPoints.login);

      final response = await http.post(url, body: request.toJson());
      print(response.body);
      print(response.statusCode);
      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        token = jsonResponse['token'];
        message = 'Success';
        return true;
      } else {
        message = jsonResponse['error'];
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(UserModel user, {File? image}) async {
    try {
      final url = Uri.parse(EndPoints.register);
      if (image != null) {
        final request = http.MultipartRequest('POST', url);
        final file = await image.readAsBytes();

        request.files.add(await http.MultipartFile.fromPath('image', image.path,
            filename: image.path.split('/').last));
        request.fields.addAll(user.toJson());
        print(request.files);
        final response = await request.send();
        print(response.statusCode);
        print(response.reasonPhrase);

        if (response.statusCode == 200) {
          message = 'Success';
          return true;
        } else {
          return false;
        }
      } else {
        final response = await http.post(url, body: user.toJson());
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 201) {
          message = 'Success';
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
