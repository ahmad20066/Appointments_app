import 'dart:convert';

import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/constants/end_points.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/category/category.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../common/local/network.dart';

class CategoryService {
  getCategories() async {
    try {
      final url = Uri.parse(EndPoints.category);

      final response = await http.get(url, headers: Network.getheaders());

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("Categories");
        print(jsonEncode(response.body));
        final categories = (jsonResponse['categorys'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      }
    } catch (e) {
      print(e);
    }
  }

  searchCategories(String search) async {
    try {
      final url = Uri.parse(EndPoints.searchCategory + '?search=$search');
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("Categories Search");
        print(jsonEncode(response.body));
        final categories = (jsonResponse['categorys'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
