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
      await locator.get<LocalRepo>().getToken();
      final token = locator.get<LocalRepo>().token;
      final response = await http.get(url, headers: Network.getheaders(token));
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final categories = (jsonResponse['categorys'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      }
    } catch (e) {
      print(e);
    }
  }
}
