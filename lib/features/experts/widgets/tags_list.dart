import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/widgets/category_tag.dart';
import 'package:appointments/features/home/widgets/categories/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TagsList extends StatelessWidget {
  const TagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Provider.of<ExpertsProvider>(context, listen: false)
                .categories
                .length,
            itemBuilder: (context, index) {
              return CategoryTag(
                  onTap: () {
                    Provider.of<ExpertsProvider>(context, listen: false)
                        .selectCategory(
                            Provider.of<ExpertsProvider>(context, listen: false)
                                .categories[index]
                                .id);
                  },
                  isSelected: Provider.of<ExpertsProvider>(context)
                              .selectedCategory ==
                          null
                      ? false
                      : Provider.of<ExpertsProvider>(context)
                              .selectedCategory!
                              .id ==
                          Provider.of<ExpertsProvider>(context, listen: false)
                              .categories[index]
                              .id,
                  text: Provider.of<ExpertsProvider>(context, listen: false)
                      .categories[index]
                      .name);
            }));
  }
}
