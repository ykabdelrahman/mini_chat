import '../models/message_model.dart';

abstract class ChatRepo {
  Future<void> sendMessage(
      {required String receiverID, required String message});
  Stream<List<MessageModel>> getMessages(
      {required String userID, required String otherUserID});

  Future<void> sendGroupMessage({required groupChatId, required message});

  Stream<List<MessageModel>> getGroupMessages({required groupChatId});
}
