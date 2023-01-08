import 'package:json_annotation/json_annotation.dart';

part 'consultation_model.g.dart';

@JsonSerializable()
class ConsultationModel {
  final int id;
  final int user_id;
  final String title;
  final String description;
  final double price;

  ConsultationModel(
      {required this.id,
      required this.user_id,
      required this.title,
      required this.description,
      required this.price});
  factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
}
