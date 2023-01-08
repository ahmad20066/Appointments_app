import 'package:appointments/features/profile/widgets/expert/consultation/add_consultaion.dart';

class EndPoints {
  static const baseUrl = 'http://10.0.2.2:8000';
  static const login = '$baseUrl/api/login';
  static const register = '$baseUrl/api/register';
  static const experts = '$baseUrl/api/experts';
  static const popularExperts = '$baseUrl/api/getmaxrating';
  static const expertsByCategory = '$baseUrl/api/getexpertsforcategory';
  static const category = '$baseUrl/api/get_category';
  static const makeReservation = '$baseUrl/api/saveregisteraton';
  static const reserve = "$baseUrl/api/saveregisteraton";
  static const addExperience = "$baseUrl/api/RegisterE";
  static const addConsultation = "$baseUrl/api/RegisterC";
  static const addTime = "$baseUrl/api/times";
  static const profile = "$baseUrl/api/profile";
  static const getRegisterations = "$baseUrl/api/getregisteraton";
  static const appointments = "$baseUrl/api/get_user_appointments";
  static const rate = "$baseUrl/api/saverating";
  static const search = "$baseUrl/api/search";
  static const searchCategory = "$baseUrl/api/search_category";
  static const wishlist = "$baseUrl/api/getwishlist";
  static const addWishlist = "$baseUrl/api/savewishlist";
  static const getExpertRegs = "$baseUrl/api/getregisted";
  static const complete_info = "$baseUrl/api/complete_infoexpert";
}
