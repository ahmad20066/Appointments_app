import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expert.g.dart';

@JsonSerializable()
class ExpertModel {
  final int id;
  final String name;
  final String email;
  final String image;
  final String Phone_Number;
  final String address;
  final double rating;
  final String category;
  final String specialization;
  final List<ExperienceModel> experience;
  final List<ConsultationModel> consultation;
  final List<AvailableTime> availabletime;
  final List<Registeration> registeraton;
  ExpertModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.Phone_Number,
    required this.address,
    required this.rating,
    required this.category,
    required this.specialization,
    required this.experience,
    required this.consultation,
    required this.availabletime,
    required this.registeraton,
  });
  factory ExpertModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertModelToJson(this);
}
