import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../new_group/data/models/group_model.dart';
import '../../data/models/message_model.dart';
import '../../data/repos/chat_repo_impl.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_text_field.dart';

class GroupChatView extends StatefulWidget {
  const GroupChatView({super.key, this.group});
  final GroupModel? group;

  @override
  State<GroupChatView> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<GroupChatView> {
  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  final ChatRepoImpl chatRepo = ChatRepoImpl();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    _listScrollController = ScrollController();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(title: widget.group!.groupName),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            StreamBuilder<List<MessageModel>>(
                stream: chatRepo.getGroupMessages(
                  groupChatId: widget.group!.id,
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Text(snapshot.error.toString());
                  }

                  if (!snapshot.hasData) {
                    return const Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    );
                  }
                  final messages = snapshot.data!;
                  return Expanded(
                    child: ListView.separated(
                      controller: _listScrollController,
                      itemCount: messages.length,
                      reverse: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return ChatBubble(
                          msg: message.message!,
                          isSender: message.senderUid == currentUser!.uid,
                        );
                      },
                    ),
                  );
                }),
            const SizedBox(height: 16),
            ChatTextField(
              controller: textEditingController,
              onSubmitted: (data) => _sendMessage(context),
              onTapIcon: () => _sendMessage(context),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context) async {
    final message = textEditingController.text;
    if (message.isNotEmpty) {
      setState(() {
        textEditingController.clear();
      });

      await chatRepo.sendGroupMessage(
        groupChatId: widget.group!.id,
        message: message,
      );
      scrollListToEnd();
    }
  }

  void scrollListToEnd() {
    _listScrollController.animateTo(
      _listScrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
