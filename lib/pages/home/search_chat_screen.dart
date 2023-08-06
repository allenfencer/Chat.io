import 'package:chat_io/pages/home/chat_screen.dart';
import 'package:chat_io/widgets/input_field.dart';
import 'package:chat_io/widgets/user_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchChatsScreen extends StatefulWidget {
  const SearchChatsScreen({super.key});

  @override
  State<SearchChatsScreen> createState() => SearchChatsScreenState();
}

class SearchChatsScreenState extends State<SearchChatsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  Stream<QuerySnapshot> getUserSnapshot(String query) {
    if (query.isEmpty) {
      return FirebaseFirestore.instance.collection('users').snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: searchQuery)
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            InputField(
              hintIcon: Icons.search,
              editingController: searchController,
              hintText: 'Search',
              textInputType: TextInputType.text,
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: getUserSnapshot(searchQuery),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((e) {
                        if (auth.currentUser!.email != e['email']) {
                          return UserTile(
                            username: e['username'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    receiverId: e['uid'],
                                    username: e['username'],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return const SizedBox();
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
