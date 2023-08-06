import 'package:chat_io/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({super.key, required this.message, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
      decoration: (alignment == Alignment.centerRight)
          ? const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(20, 20),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)))
          : const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.elliptical(20, 20),
                  bottomRight: Radius.circular(8))),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Text(
        message,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: (alignment == Alignment.centerRight)
                ? Colors.white
                : Colors.black),
      ),
    );
  }
}
