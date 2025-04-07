import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String? message;
  final String? senderUid;
  final String? senderEmail;
  final String? receiverUid;
  final Timestamp? timestamp;

  MessageModel({
    this.message,
    this.senderUid,
    this.senderEmail,
    this.receiverUid,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderUid': senderUid,
      'senderEmail': senderEmail,
      'receiverUid': receiverUid,
      'timestamp': timestamp!.toDate().toString(),
    };
  }

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData['message'],
      senderUid: jsonData['senderUid'],
      senderEmail: jsonData['senderEmail'],
      receiverUid: jsonData['receiverUid'],
      timestamp: Timestamp.fromDate(DateTime.parse(jsonData['timestamp'])),
    );
  }

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    final timestamp = Timestamp.fromDate(DateTime.parse(data?['timestamp']));
    return MessageModel(
      message: data?['message'],
      senderUid: data?['senderUid'],
      senderEmail: data?['senderEmail'],
      receiverUid: data?['receiverUid'],
      timestamp: timestamp,
    );
  }
}
