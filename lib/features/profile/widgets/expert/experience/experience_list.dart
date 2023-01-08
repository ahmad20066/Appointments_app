import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_card.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExperienceList extends StatefulWidget {
  ExperienceList({super.key});

  @override
  State<ExperienceList> createState() => _ExperienceListState();
}

class _ExperienceListState extends State<ExperienceList> {
  @override
  Widget build(BuildContext context) {
    final experiences =
        Provider.of<UserProvider>(context).currentUser!.experience!;
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        return ExperienceCard(
          experience: experiences[index],
        );
      },
    );
  }
}
