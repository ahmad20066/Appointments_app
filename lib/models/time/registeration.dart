import 'package:json_annotation/json_annotation.dart';

part 'registeration.g.dart';

@JsonSerializable()
class Registeration {
  final int id;
  final String day;
  final int user_id;
  final int normal_id;
  final String start_time;
  final String end_time;
  bool registered;

  Registeration(
      {required this.id,
      required this.day,
      required this.user_id,
      required this.normal_id,
      required this.start_time,
      required this.end_time,
      required this.registered});
  factory Registeration.fromJson(Map<String, dynamic> json) =>
      _$RegisterationFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterationToJson(this);
}
