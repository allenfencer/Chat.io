import 'package:chat_io/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // send message
  Future sendMessage(String receiverId, String message) async {
    try {
      //get current user info
      String currUserId = auth.currentUser!.uid;
      String currUserEmail = auth.currentUser!.email!;
      Timestamp currTime = Timestamp.now();

      //create message model
      MessageModel messageModel = MessageModel(
          receiverId: receiverId,
          senderEmail: currUserEmail,
          senderId: currUserId,
          message: message,
          timestamp: currTime);

      //create chat room
      List<String> idList = [currUserId, receiverId];
      idList.sort();
      String chatRoomId = idList.join('_');

      //add message to db
      await firestore
          .collection('chat-rooms')
          .doc(chatRoomId)
          .collection('chat')
          .add(messageModel.messageToMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  //get message
  Stream<QuerySnapshot> getMessages(String senderId, String receiverId) {
    List<String> idList = [senderId, receiverId];
    idList.sort();
    String chatRoomId = idList.join('_');
    return firestore
        .collection('chat-rooms')
        .doc(chatRoomId)
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
