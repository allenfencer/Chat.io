// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String receiverId;
  final String senderEmail;
  final String senderId;
  final String message;
  final Timestamp timestamp;

  MessageModel(
      {required this.receiverId,
      required this.senderId,
      required this.senderEmail,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> messageToMap() {
    return {
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp
    };
  }
}
