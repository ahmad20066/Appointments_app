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
      Phone_Number: json['Phone_Number'] as String?,
      Category: json['Category'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, String> _$UserModelToJson(UserModel instance) => <String, String>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      if (instance.address != null) 'address': instance.address!,
      if (instance.Phone_Number != null) 'Phone_Number': instance.Phone_Number!,
      if (instance.Category != null) 'Category': instance.Category!,
      if (instance.rating != null) 'rating': instance.rating.toString()!,
    };
