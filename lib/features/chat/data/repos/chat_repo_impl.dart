import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/message_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<void> sendMessage(
      {required String receiverID, required String message}) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      message: message,
      receiverUid: receiverID,
      senderEmail: currentUserEmail,
      senderUid: currentUserID,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toJson());
  }

  @override
  Stream<List<MessageModel>> getMessages(
      {required String userID, required String otherUserID}) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageModel.fromFirestore(doc))
              .toList(),
        );
  }

  @override
  Future<void> sendGroupMessage(
      {required groupChatId, required message}) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      message: message,
      receiverUid: groupChatId,
      senderEmail: currentUserEmail,
      senderUid: currentUserID,
      timestamp: timestamp,
    );
    await _firestore
        .collection('groups')
        .doc(groupChatId)
        .collection('messages')
        .add(newMessage.toJson());
  }

  @override
  Stream<List<MessageModel>> getGroupMessages({required groupChatId}) {
    return _firestore
        .collection('groups')
        .doc(groupChatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageModel.fromFirestore(doc))
              .toList(),
        );
  }
}
