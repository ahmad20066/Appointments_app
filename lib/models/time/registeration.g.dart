// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registeration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registeration _$RegisterationFromJson(Map<String, dynamic> json) =>
    Registeration(
      id: json['id'] as int,
      day: json['day'] as String,
      user_id: json['user_id'] as int,
      normal_id: json['normal_id'] ?? 0,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      registered: json['registered'] == 0 ? false : true,
    );

Map<String, dynamic> _$RegisterationToJson(Registeration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'user_id': instance.user_id,
      'normal_id': instance.normal_id,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'registered': instance.registered,
    };
