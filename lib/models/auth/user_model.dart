import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

import '../consultaion/consultation_model.dart';
import '../experience/experience_model.dart';
import '../time/available_times.dart';
import '../time/registeration.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final double balance;
  final String? address;
  final String? Phone_Number;
  final String? Category;
  final double? rating;
  final String? image;
  final String? specialization;
  final List<ExperienceModel>? experience;
  final List<ConsultationModel>? consultation;
  final List<AvailableTime>? availabletime;
  final List<Registeration>? registeraton;
  UserModel(
      {required this.name,
      required this.id,
      required this.email,
      required this.password,
      required this.role,
      required this.balance,
      this.address,
      this.specialization,
      this.image,
      this.Phone_Number,
      this.availabletime,
      this.consultation,
      this.registeraton,
      this.experience,
      this.Category,
      this.rating});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, String> toJson() => _$UserModelToJson(this);
}
