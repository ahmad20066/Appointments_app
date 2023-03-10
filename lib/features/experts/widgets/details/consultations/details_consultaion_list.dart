import 'package:appointments/features/experts/widgets/details/consultations/consultation_widget.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:flutter/material.dart';

class DetailsConsultationsList extends StatelessWidget {
  final List<ConsultationModel> consultations;
  final List<Registeration> registerations;
  const DetailsConsultationsList(
      {super.key, required this.consultations, required this.registerations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: consultations.length,
      itemBuilder: (context, index) => ConsultationWidget(
        consultation: consultations[index],
        registerations: registerations,
      ),
    );
  }
}
