import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_text_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Duhhh',
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: true,
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return const ChatBubble(
                    msg: 'hi how u doing today?',
                    isSender: true,
                  );
                },
              ),
            ),
            const SizedBox(height: 6),
            const ChatTextField(),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
