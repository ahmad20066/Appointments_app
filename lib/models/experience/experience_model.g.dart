// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      years: (json['years'] as num).toDouble(),
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title,
      'description': instance.description,
      'years': instance.years,
    };
