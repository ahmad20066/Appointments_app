import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/experience/experience_model.dart';

class UserProvider with ChangeNotifier {
  List<ConsultationModel> consultations = [
    ConsultationModel(
        id: 1,
        userId: 1,
        title: "Web Development",
        description:
            "I can develop any webiste using new technologies as React js,Laravel,Django etc...",
        price: 25)
  ];
  List<ExperienceModel> experiences = [
    ExperienceModel(
        id: 1,
        user_id: 1,
        title: "FrontEnd Developer",
        description:
            'Front-End Developers design and develop websites and web applications by using web technologies such as HTML, CSS, DOM, and JavaScript, that either run on the Open Web Platform or function as compilation input for non-web platform environments like React Native)',
        years: 2.5,
        created_at: DateTime.now(),
        updated_at: DateTime.now())
  ];
  deleteConsultation(int id) {
    consultations.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  deleteExperience(int id) {
    experiences.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
