import 'package:appointments/common/widgets/middleText.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/widgets/search_bar.dart';
import 'package:appointments/features/home/widgets/categories/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = "/categories";
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _future;
  @override
  void initState() {
    _future =
        Provider.of<ExpertsProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30.h,
          ),
          SearchBar(onChanged: (value) {
            setState(() {
              _future = Provider.of<ExpertsProvider>(context, listen: false)
                  .searchCategories(value);
            });
          }),
          MiddleText(text: "Categories"),
          FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1),
                  itemCount:
                      Provider.of<ExpertsProvider>(context, listen: false)
                          .categories
                          .length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      image:
                          Provider.of<ExpertsProvider>(context, listen: false)
                              .categories[index]
                              .image,
                      text: Provider.of<ExpertsProvider>(context, listen: false)
                          .categories[index]
                          .name,
                      id: Provider.of<ExpertsProvider>(context, listen: false)
                          .categories[index]
                          .id,
                    );
                  },
                );
              })
        ]),
      ),
    );
  }
}
