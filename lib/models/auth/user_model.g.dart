// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    role: json['role'] as String,
    address: json['address'] as String?,
    image: json['image'] as String?,
    Phone_Number:
        json['Phone_Number'] == null ? null : json['Phone_Number'].toString(),
    Category: json['Category'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    experience: json['experience'] == null
        ? null
        : (json['experience'] as List<dynamic>)
            .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    consultation: json['consulation'] == null
        ? null
        : (json['consulation'] as List<dynamic>)
            .map((e) => ConsultationModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    availabletime: json['availabletime'] == null
        ? null
        : (json['availabletime'] as List<dynamic>)
            .map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
            .toList(),
    registeraton: json['registeraton'] == null
        ? null
        : (json['registeraton'] as List<dynamic>)
            .map((e) => Registeration.fromJson(e as Map<String, dynamic>))
            .toList(),
    balance: json['balance'].toDouble(),
    specialization: json['specialization'],
    id: json['id']);

Map<String, String> _$UserModelToJson(UserModel instance) => <String, String>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      if (instance.address != null) 'address': instance.address!,
      if (instance.Phone_Number != null) 'Phone_Number': instance.Phone_Number!,
      if (instance.Category != null) 'category': instance.Category!,
      if (instance.rating != null) 'rating': instance.rating.toString(),
      if (instance.specialization != null)
        'specialization': instance.specialization!,
    };
