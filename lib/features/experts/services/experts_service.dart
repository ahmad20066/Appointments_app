import 'dart:convert';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/common/local/network.dart';
import 'package:appointments/constants/end_points.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:appointments/models/expert/popular_expert.dart';
import 'package:http/http.dart' as http;

class ExpertsService {
  getPopularExperts() async {
    try {
      final url = Uri.parse(EndPoints.popularExperts);
      final headers = Network.getheaders(locator.get<LocalRepo>().token);
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
        url = Uri.parse(EndPoints.expertsByCategory + '?category=$category');
      } else {
        url = Uri.parse(EndPoints.experts);
      }
      print(category);
      final headers = Network.getheaders(locator.get<LocalRepo>().token);
      final response = await http.get(url, headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
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
}
