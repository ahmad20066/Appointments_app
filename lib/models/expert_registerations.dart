import 'package:appointments/models/auth/user_model.dart';

class ExpertReg {
  final int id;
  final String day;
  final int user_id;
  final int normal_id;
  final String start_time;
  final String end_time;
  final RegUser user;

  ExpertReg(
      {required this.id,
      required this.day,
      required this.user_id,
      required this.normal_id,
      required this.start_time,
      required this.end_time,
      required this.user});
  factory ExpertReg.fromMap(Map<String, dynamic> map) {
    print('ssssss');
    return ExpertReg(
        id: map['id'],
        day: map['day'],
        user_id: map['user_id'],
        normal_id: map['normal_id'],
        start_time: map['start_time'],
        end_time: map['end_time'],
        user: RegUser.fromMap(map['normals']));
  }
}

class RegUser {
  final int id;
  final String name;

  RegUser({required this.id, required this.name});
  factory RegUser.fromMap(Map<String, dynamic> map) {
    print("************");
    return RegUser(id: map['id'], name: map['name']);
  }
}
