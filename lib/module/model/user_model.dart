// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String userName;
  String firstName;
  String lastName;
  String gender;
  String dob;
  String phoneNumer;
  String uid;
  Timestamp? createdAt;
  bool? emailVerified;
  UserModel({
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.phoneNumer,
    required this.uid,
    this.createdAt,
    this.emailVerified,
  });

  UserModel copyWith({
    String? email,
    String? userName,
    String? firstName,
    String? lastName,
    String? gender,
    String? dob,
    String? phoneNumer,
    String? uid,
    Timestamp? createdAt,
    bool? emailVerified,
  }) {
    return UserModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      phoneNumer: phoneNumer ?? this.phoneNumer,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
      'phoneNumer': phoneNumer,
      'uid': uid,
      'createdAt': createdAt,
      'emailVerified': emailVerified,
    };
  }

  static UserModel empty = UserModel(
      createdAt: null,
      email: "",
      emailVerified: false,
      dob: "",
      firstName: "",
      gender: "",
      lastName: "",
      phoneNumer: "",
      uid: "",
      userName: "");
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      userName: map['userName'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      gender: map['gender'],
      dob: map['dob'],
      phoneNumer: map['phoneNumer'],
      uid: map['uid'] as String,
      createdAt: map['createdAt'],
      emailVerified: map['emailVerified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, userName: $userName, firstName: $firstName, lastName: $lastName, gender: $gender, dob: $dob, phoneNumer: $phoneNumer, uid: $uid, createdAt: $createdAt, emailVerified: $emailVerified)';
  }
}
