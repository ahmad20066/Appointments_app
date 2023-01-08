// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertModel _$ExpertModelFromJson(Map<String, dynamic> json) => ExpertModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      Phone_Number: json['Phone_Number'].toString(),
      address: json['address'] as String,
      rating: json['rating'] == null ? 0 : (json['rating'] as num).toDouble(),
      category: json['category'] as String,
      specialization: json['specialization'] as String,
      experience: (json['experience'] as List<dynamic>)
          .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      consultation: (json['consulation'] as List<dynamic>)
          .map((e) => ConsultationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabletime: (json['availabletime'] as List<dynamic>)
          .map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      registeraton: (json['registeraton'] as List<dynamic>)
          .map((e) => Registeration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpertModelToJson(ExpertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'Phone_Number': instance.Phone_Number,
      'address': instance.address,
      'rating': instance.rating,
      'category': instance.category,
      'specialization': instance.specialization,
      'experience': instance.experience,
      'consultation': instance.consultation,
      'availabletime': instance.availabletime,
    };
