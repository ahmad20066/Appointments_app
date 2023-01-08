import 'package:json_annotation/json_annotation.dart';

part 'available_times.g.dart';

@JsonSerializable()
class AvailableTime {
  final int id;
  final int user_id;
  final String day;
  final String start_time;
  final String end_time;

  AvailableTime({
    required this.id,
    required this.day,
    required this.user_id,
    required this.start_time,
    required this.end_time,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableTimeToJson(this);
}
