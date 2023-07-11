// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String? ?? '',
    )..name = json['name'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'errorMessage': instance.errorMessage,
      'isAdmin': instance.isAdmin,
    };
