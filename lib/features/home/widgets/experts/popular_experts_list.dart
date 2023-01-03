import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/home/widgets/experts/popular_expert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PopularExpertsList extends StatefulWidget {
  const PopularExpertsList({Key? key}) : super(key: key);

  @override
  State<PopularExpertsList> createState() => _PopularExpertsListState();
}

class _PopularExpertsListState extends State<PopularExpertsList> {
  late final _future;
  @override
  void initState() {
    _future = Provider.of<ExpertsProvider>(context, listen: false)
        .getPopularExperts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: 250.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          Provider.of<ExpertsProvider>(context, listen: false)
                              .popularExperts
                              .length,
                      itemBuilder: (context, index) {
                        return PopularExpertCard(
                          expert: Provider.of<ExpertsProvider>(context,
                                  listen: false)
                              .popularExperts[index],
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
