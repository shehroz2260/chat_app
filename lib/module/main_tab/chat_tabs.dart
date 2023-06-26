import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/chat_widget.dart';
import '../chat_screens/message_screen.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatWidget(
          image: "assets/Ellipse 2.png",
          subTitle:
              "Sed ligula erat, dignissim sit at amet dictum id, iaculis… ",
          time: "32 min",
          title: "Gunther Beard",
          onTap: () {
            Get.to(const MessageScreen());
          },
        )
      ],
    );
  }
}
