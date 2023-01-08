import 'package:appointments/features/profile/widgets/expert/consultation/consultation_card.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class ConsultaionList extends StatefulWidget {
  ConsultaionList({super.key});

  @override
  State<ConsultaionList> createState() => _ConsultaionListState();
}

class _ConsultaionListState extends State<ConsultaionList> {
  @override
  Widget build(BuildContext context) {
    final consultations =
        Provider.of<UserProvider>(context).currentUser!.consultation!;
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        return ConsultationCard(
          consultation: consultations[index],
        );
      },
    );
  }
}
