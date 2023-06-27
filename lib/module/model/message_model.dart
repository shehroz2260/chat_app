// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String recieverId;
  final String message;
  final Timestamp createdAt;
  MessageModel({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.createdAt,
  });

  MessageModel copyWith({
    String? senderId,
    String? recieverId,
    String? message,
    Timestamp? createdAt,
  }) {
    return MessageModel(
      senderId: senderId ?? this.senderId,
      recieverId: recieverId ?? this.recieverId,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'createdAt': createdAt,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      recieverId: map['recieverId'],
      message: map['message'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(senderId: $senderId, recieverId: $recieverId, message: $message, createdAt: $createdAt)';
  }
}
