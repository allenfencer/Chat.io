import 'package:chat_io/services/chat_service.dart';
import 'package:chat_io/widgets/chat_bubble.dart';
import 'package:chat_io/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String username;
  const ChatScreen(
      {super.key, required this.receiverId, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future sendMessage() async {
    ChatService().sendMessage(widget.receiverId, messageController.text.trim());
    messageController.clear();
  }

  Widget buildMessageInputField() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: InputField(
              editingController: messageController,
              hintText: 'Enter message',
              textInputType: TextInputType.text,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              CupertinoIcons.arrow_up_circle_fill,
              size: 35,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.username,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: StreamBuilder(
        stream:
            ChatService().getMessages(auth.currentUser!.uid, widget.receiverId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    children: snapshot.data!.docs.map((e) {
                      var alignment =
                          (e['senderEmail'] == auth.currentUser!.email!)
                              ? Alignment.centerRight
                              : Alignment.centerLeft;
                      return Container(
                        alignment: alignment,
                        margin: alignment == Alignment.centerRight
                            ? EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 4)
                            : EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 4),
                        child: ChatBubble(
                          message: e['message'],
                          alignment: alignment,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildMessageInputField()
              ],
            );
          }
        },
      ),
    );
  }
}
