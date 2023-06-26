import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class ChatWidget extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String title;
  final String subTitle;
  final String time;
  const ChatWidget({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffD8D8D8)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Column(
            children: [
              Text(
                time,
                style: const TextStyle(color: Color(0xff77838F)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppStyle.greencolor),
                child: const Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
