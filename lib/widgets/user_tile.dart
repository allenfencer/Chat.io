import 'package:chat_io/constants/colors.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String username;
  final VoidCallback onTap;
  const UserTile({super.key, required this.username, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   contentPadding: EdgeInsets.zero,
    //   onTap: onTap,
    //   title: Text(username),
    //   isThreeLine: false,
    //   dense: false,
    //   visualDensity: VisualDensity.compact,
    //   subtitle: Divider(
    //     color: Colors.grey.shade300,
    //   ),
    // );
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(username),
          ),
          Divider(
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
