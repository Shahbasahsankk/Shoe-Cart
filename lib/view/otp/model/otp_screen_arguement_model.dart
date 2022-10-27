import 'package:e_commerce_app/model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}
