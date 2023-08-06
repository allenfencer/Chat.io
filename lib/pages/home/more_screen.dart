import 'package:chat_io/pages/auth/login_screen.dart';
import 'package:chat_io/services/auth_service.dart';
import 'package:chat_io/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  Future futureData = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();

  logout() async {
    try {
      setState(() {
        isLoading = true;
      });
      await auth.signOut();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())),
          (route) => false);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xffEDEDED),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      snapshot.data!.data()!['fullName'],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: Text(
                      'update phone',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.grey.shade700),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    isLoading: isLoading,
                    buttonText: 'Logout',
                    function: logout,
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              );
            }),
      ),
    );
  }
}
