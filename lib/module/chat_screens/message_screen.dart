import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_app_bar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatScreenAppBar(
          activeNow: "Active Now",
          imageUrl: "assets/Ellipse 2.png",
          userName: "Gunther Beard"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BubbleSpecialThree(
              text: 'Sed ligula erat, dignissim sit amet dictum id?',
              color: AppStyle.greencolor,
              tail: true,
              textStyle: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const BubbleSpecialThree(
              text: 'Sed ligula erat, dignissim sit amet dictum id?',
              color: Color(0xffEFEEF4),
              tail: true,
              textStyle: TextStyle(color: Color(0xff77838F), fontSize: 16),
              isSender: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(14),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              hintText: "Type a Message",
              suffixIcon: SizedBox(
                width: 68,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      AppAsset.lineIcon,
                      width: 8,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset(
                      AppAsset.sendButton,
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
