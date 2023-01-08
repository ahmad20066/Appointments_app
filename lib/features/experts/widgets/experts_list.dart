import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:appointments/features/experts/widgets/expert_card.dart';
import 'package:appointments/features/experts/widgets/search_bar.dart';
import 'package:appointments/features/home/widgets/experts/popular_expert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'category_tag.dart';

class ExpertsList extends StatefulWidget {
  const ExpertsList({Key? key}) : super(key: key);

  @override
  State<ExpertsList> createState() => _ExpertsListState();
}

class _ExpertsListState extends State<ExpertsList> {
  var _future;
  @override
  void initState() {
    _future = Provider.of<ExpertsProvider>(context, listen: false).getExperts(
        category: Provider.of<ExpertsProvider>(context, listen: false)
            .selectedCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                            .selectCategory(Provider.of<ExpertsProvider>(
                                    context,
                                    listen: false)
                                .categories[index]
                                .id);
                        setState(() {
                          _future = Provider.of<ExpertsProvider>(context,
                                  listen: false)
                              .getExperts(
                                  category: Provider.of<ExpertsProvider>(
                                          context,
                                          listen: false)
                                      .selectedCategory);
                        });
                      },
                      isSelected: Provider.of<ExpertsProvider>(context)
                                  .selectedCategory ==
                              null
                          ? false
                          : Provider.of<ExpertsProvider>(context)
                                  .selectedCategory!
                                  .id ==
                              Provider.of<ExpertsProvider>(context,
                                      listen: false)
                                  .categories[index]
                                  .id,
                      text: Provider.of<ExpertsProvider>(context, listen: false)
                          .categories[index]
                          .name);
                })),
        SizedBox(
          height: 30.h,
        ),
        SearchBar(onChanged: (value) {
          setState(() {});
          if (value.isEmpty) {
            _future = Provider.of<ExpertsProvider>(context, listen: false)
                .getExperts(
                    category:
                        Provider.of<ExpertsProvider>(context, listen: false)
                            .selectedCategory);
          } else {
            _future = Provider.of<ExpertsProvider>(context, listen: false)
                .search(value);
          }
        }),
        FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.65),
                shrinkWrap: true,
                itemCount: Provider.of<ExpertsProvider>(context).experts.length,
                itemBuilder: (context, index) {
                  return PopularExpertCard(
                      expert:
                          Provider.of<ExpertsProvider>(context).experts[index]);
                },
              );
            }),
      ],
    );
  }
}
