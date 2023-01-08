import 'package:appointments/features/experts/services/experts_service.dart';
import 'package:appointments/features/profile/services/user_services.dart';
import 'package:appointments/features/profile/widgets/expert/consultation/add_consultaion.dart';
import 'package:appointments/locator.dart';
import 'package:appointments/models/appointment.dart';
import 'package:appointments/models/consultaion/consultation_add_request.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:appointments/models/experience/experience_add_request.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:appointments/models/expert_registerations.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:appointments/models/time/availabletime_add_request.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/auth/user_model.dart';
import '../../../models/experience/experience_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;
  List<AppointmentModel> appointments = [];
  List<ExpertReg> expertRegs = [];
  reserve(int regId, int conId) async {
    try {
      final success = await locator.get<ExpertsService>().reserve(regId, conId);
      if (success) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  addExperience(String title, String description, double years) async {
    print(years);
    final addedExperience = ExperienceAddRequest(
        description: description, title: title, years: years.toString());
    final success =
        await locator.get<ExpertsService>().addExperience(addedExperience);

    if (success) {
      return true;
    } else {
      return false;
    }
  }

  addConsultation(String title, String description, double price) async {
    final addedConsultation = ConsultationAddRequest(
        title: title, description: description, price: price);
    final success =
        await locator.get<ExpertsService>().addConsultation(addedConsultation);
    if (success) {
      return true;
    } else {
      return false;
    }
  }

  addTime(String day, String start_time, String end_time) async {
    final addedTime = AvailableTimeAddRequest(
        day: day, start_time: start_time, end_time: end_time);
    print(addedTime.toJson());
    final success = await locator.get<ExpertsService>().addTime(addedTime);
    if (success) {
      return true;
    } else {
      return false;
    }
  }

  getProfile() async {
    try {
      currentUser = await locator.get<UserServices>().getProfile();
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  getAppointments() async {
    appointments = await locator.get<UserServices>().getAppointments();
    notifyListeners();
  }

  rate(int expertId, double rating) async {
    final success = await locator.get<UserServices>().rate(expertId, rating);
    return success;
  }

  getExpertRegs() async {
    expertRegs = await locator.get<UserServices>().getExpertRegs();
    notifyListeners();
  }
}
