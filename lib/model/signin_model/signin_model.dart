import 'package:flutter/cupertino.dart';

class SignInModel {
  final String refreshToken;
  final String accessToken;
  SignInModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}
