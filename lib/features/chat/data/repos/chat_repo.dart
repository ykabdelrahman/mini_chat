import '../models/message_model.dart';

abstract class ChatRepo {
  Future<void> sendMessage(
      {required String receiverID, required String message});
  Stream<List<MessageModel>> getMessages(
      {required String userID, required String otherUserID});
}
