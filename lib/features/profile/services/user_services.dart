import 'dart:convert';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/constants/end_points.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/appointment.dart';
import 'package:appointments/models/auth/user_model.dart';
import 'package:appointments/models/expert_registerations.dart';
import 'package:appointments/models/time/registeration.dart';

import '../../../common/local/network.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<UserModel> getProfile() async {
    try {
      final url = Uri.parse(EndPoints.profile);
      final token = locator.get<LocalRepo>().token;
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print("Profile");
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final user = UserModel.fromJson(jsonResponse['user'][0]);
        return user;
      } else if (response.statusCode == 401) {
        final e = Exception('Invalid Token');
        throw e;
      } else {
        throw Error();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<AppointmentModel>> getAppointments() async {
    try {
      final url = Uri.parse(EndPoints.appointments);
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print("Appointments");
      print(response.body);
      if (response.statusCode == 200) {
        final jsonresponse = jsonDecode(response.body);
        final appointments = (jsonresponse['appointments'] as List)
            .map((e) => AppointmentModel.fromMap(e))
            .toList();
        return appointments;
      } else {
        throw Exception('Error Appointments');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> rate(int expertId, double rating) async {
    try {
      final url =
          Uri.parse("${EndPoints.rate}?expert_id=$expertId&rating=$rating");
      final headers = Network.getheaders();
      final response = await http.put(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ExpertReg>> getExpertRegs() async {
    try {
      final url = Uri.parse(EndPoints.getExpertRegs);
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final regs = (jsonResponse["registed"] as List)
            .map((e) => ExpertReg.fromMap(e))
            .toList();
        return regs;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
