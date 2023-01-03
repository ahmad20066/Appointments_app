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
      rating: (json['rating'] as num).toDouble(),
      category: json['category'] as String,
      experience: (json['experience'] as List).map((e) {
        return ExperienceModel.frommap(e);
      }).toList(),
      consultation: (json['consulation'] as List).map((e) {
        return ConsultationModel.frommap(e);
      }).toList(),
      specialization: json['specialization'] as String,
      availabletime: (json['availabletime'] as List).map((e) {
        return AvailableTime.fromMap(e);
      }).toList(),
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
    };
