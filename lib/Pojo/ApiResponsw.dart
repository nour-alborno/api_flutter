import 'package:api_flutter/Pojo/UserModel.dart';

class ApiResponse {
  bool? status;
  String? message;
  User? object;
  String? code;

  ApiResponse({this.status, this.message, this.object});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object =
    json['object'] != null ?  User.fromJson(json['object']) : null;
    code = json['code'] != null ?  json['code'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.object != null) {
      data['object'] = this.object!.toJson();
    }
    return data;
  }
}

class Object {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? verificationCode;
  String? fcmToken;
  String? token;
  String? refreshToken;
  bool? isActive;

  Object(
      {this.id,
        this.fullName,
        this.email,
        this.gender,
        this.verificationCode,
        this.fcmToken,
        this.token,
        this.refreshToken,
        this.isActive});

  Object.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    verificationCode = json['verification_code'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['verification_code'] = this.verificationCode;
    data['fcm_token'] = this.fcmToken;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['is_active'] = this.isActive;
    return data;
  }
}