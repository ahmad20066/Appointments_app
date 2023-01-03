import 'package:appointments/features/experts/widgets/details/experience/experience_widget.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:flutter/material.dart';

class DetailsExperienceList extends StatelessWidget {
  final List<ExperienceModel> experiences;
  const DetailsExperienceList({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: experiences.length,
      itemBuilder: (context, index) =>
          ExperienceWidget(experience: experiences[index]),
    );
  }
}
