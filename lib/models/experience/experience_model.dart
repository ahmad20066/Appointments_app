import 'package:json_annotation/json_annotation.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperienceModel {
  final int id;
  final int user_id;
  final String title;
  final String description;
  final double years;

  ExperienceModel({
    required this.id,
    required this.user_id,
    required this.title,
    required this.description,
    required this.years,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}
