// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTime _$AvailableTimeFromJson(Map<String, dynamic> json) =>
    AvailableTime(
      id: json['id'] as int,
      day: json['day'] as String,
      user_id: json['user_id'] as int,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );

Map<String, dynamic> _$AvailableTimeToJson(AvailableTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'day': instance.day,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };
