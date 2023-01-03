import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:appointments/features/experts/widgets/expert_card.dart';
import 'package:appointments/features/home/widgets/experts/popular_expert_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpertsList extends StatelessWidget {
  const ExpertsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ExpertsProvider>(context, listen: false).getExperts(
            category: Provider.of<ExpertsProvider>(context).selectedCategory),
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
                  expert: Provider.of<ExpertsProvider>(context).experts[index]);
            },
          );
        });
  }
}
