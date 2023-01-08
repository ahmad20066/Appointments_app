import 'package:appointments/models/auth/user_model.dart';
import 'package:appointments/models/expert/expert.dart';

class AppointmentModel {
  final int id;
  final String day;
  final int user_id;
  final int normal_id;
  final String start_time;
  final String end_time;
  final UserModel expert;

  AppointmentModel(
      {required this.id,
      required this.day,
      required this.user_id,
      required this.normal_id,
      required this.start_time,
      required this.end_time,
      required this.expert});
  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
        id: map['id'],
        day: map['day'],
        user_id: map['user_id'],
        normal_id: map['normal_id'],
        start_time: map['start_time'],
        end_time: map['end_time'],
        expert: UserModel.fromJson(map['normals']));
  }
}
