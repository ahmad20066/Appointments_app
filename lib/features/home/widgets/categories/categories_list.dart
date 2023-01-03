import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:appointments/features/home/widgets/categories/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../models/category/category.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late final _future;
  @override
  void initState() {
    _future =
        Provider.of<ExpertsProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final categories =
              Provider.of<ExpertsProvider>(context, listen: false).categories;
          return Container(
            height: 130.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                            id: categories[index].id,
                            image: categories[index].image,
                            text: categories[index].name);
                      }),
                ],
              ),
            ),
          );
        });
  }
}
