import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String role;

  final String? address;
  final String? Phone_Number;
  final String? Category;
  final double? rating;
  final String? image;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      this.address,
      this.image,
      this.Phone_Number,
      this.Category,
      this.rating});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, String> toJson() => _$UserModelToJson(this);
}
