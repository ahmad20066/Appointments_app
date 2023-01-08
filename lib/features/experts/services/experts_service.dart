import 'dart:convert';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/common/local/network.dart';
import 'package:appointments/constants/end_points.dart';
import 'package:appointments/features/profile/widgets/expert/consultation/add_consultaion.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/consultaion/consultation_add_request.dart';
import 'package:appointments/models/experience/experience_add_request.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:appointments/models/time/availabletime_add_request.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:http/http.dart' as http;

class ExpertsService {
  getPopularExperts() async {
    try {
      final url = Uri.parse(EndPoints.popularExperts);
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print("*********************");
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final experts = (jsonResponse['experts'] as List)
            .map((e) => ExpertModel.fromJson(e))
            .toList();
        return experts;
      } else {
        throw Exception('Error Getting Experts');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  getExperts({String? category}) async {
    try {
      late final url;
      if (category != null) {
        url = Uri.parse('${EndPoints.expertsByCategory}?category=$category');
      } else {
        url = Uri.parse(EndPoints.experts);
      }

      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("Experts");
        print(jsonResponse['experts']);
        final experts = (jsonResponse['experts'] as List)
            .map((e) => ExpertModel.fromJson(e))
            .toList();
        return experts;
      } else {
        throw Exception('Error Getting Experts');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<ExpertModel>> search(String search) async {
    try {
      final url = Uri.parse(EndPoints.search + "?search=$search");

      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print("Search");
      print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final experts = (jsonResponse['experts'] as List)
            .map((e) => ExpertModel.fromJson(e))
            .toList();
        return experts;
      } else {
        throw Exception('Error Getting Experts');
      }
    } catch (e) {
      print("Error search");
      print(e);
      rethrow;
    }
  }

  Future<bool> reserve(int regId, int conId) async {
    try {
      final url =
          Uri.parse('${EndPoints.reserve}?registeraton_id=$regId&conId=$conId');
      final token = locator.get<LocalRepo>().token;
      final headers = Network.getheaders();
      final response = await http.put(url, headers: headers);
      print("Reserve");
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

  Future addExperience(ExperienceAddRequest experience) async {
    try {
      final url = Uri.parse(EndPoints.addExperience);
      final token = locator.get<LocalRepo>().token;
      final headers = Network.getheaders();
      print(headers);
      print("sssssssssss");
      final response =
          await http.post(url, headers: headers, body: experience.toJson());
      print("Experience");
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error experience");
      print(e);
      return false;
    }
  }

  Future addConsultation(ConsultationAddRequest consultation) async {
    try {
      final url = Uri.parse(EndPoints.addConsultation);
      final token = locator.get<LocalRepo>().token;
      final headers = Network.getheaders();
      final response =
          await http.post(url, headers: headers, body: consultation.toJson());
      print("Time");
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

  Future addTime(AvailableTimeAddRequest request) async {
    try {
      final url = Uri.parse(EndPoints.addTime);
      final token = locator.get<LocalRepo>().token;
      final headers = Network.getheaders();
      final response =
          await http.post(url, headers: headers, body: request.toJson());
      print("Time");
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

  Future getRegisterations(int expertId) async {
    try {
      final url =
          Uri.parse(EndPoints.getRegisterations + "?expert_id=$expertId");
      final response = await http.get(url, headers: Network.getheaders());
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final regs = (jsonResponse['registreation'] as List)
            .map((e) => Registeration.fromJson(e))
            .toList();
        return regs;
      } else {
        throw Exception('Error regs');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
