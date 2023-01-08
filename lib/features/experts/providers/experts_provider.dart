import 'package:appointments/features/experts/services/category_service.dart';
import 'package:appointments/features/experts/services/experts_service.dart';
import 'package:appointments/models/category/category.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';

class ExpertsProvider with ChangeNotifier {
  CategoryModel? selectedCategory;
  List<ExpertModel> popularExperts = [];
  List<ExpertModel> experts = [];
  List<CategoryModel> categories = [];
  List<Registeration> expertRegisteration = [];
  int? currentExpertId;

  selectCategory(int catId) {
    selectedCategory = categories.firstWhere((element) => element.id == catId);
    notifyListeners();
  }

  nullCategory() {
    selectedCategory = null;
    notifyListeners();
  }

  getPopularExperts() async {
    try {
      final _service = ExpertsService();
      popularExperts = await _service.getPopularExperts();
    } catch (e) {
      print(e);
    }
  }

  getExperts({CategoryModel? category, String? search}) async {
    try {
      print('aaaa');
      final _service = ExpertsService();
      experts = await _service.getExperts(
          category: category != null ? category.name : null);
      print("aaaaaa");
    } catch (e) {
      print(e);
    }
  }

  search(String search) async {
    try {
      print('aaaa');
      final _service = ExpertsService();
      experts = await _service.search(search);
      notifyListeners();
      print("aaaaaa");
    } catch (e) {
      print(e);
    }
  }

  searchCategories(String search) async {
    try {
      print('aaaa');
      final _service = CategoryService();
      categories = await _service.searchCategories(search);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getCategories() async {
    final _servie = CategoryService();
    categories = await _servie.getCategories();
  }

  getExpertRegisterations() async {
    expertRegisteration =
        await locator.get<ExpertsService>().getRegisterations(currentExpertId!);
    notifyListeners();
  }
}
