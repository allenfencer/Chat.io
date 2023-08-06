import 'package:chat_io/pages/home/search_chat_screen.dart';
import 'package:chat_io/pages/home/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [SearchChatsScreen(), MoreScreen()];
  int currIndex = 0;

  Widget customBottomNavBar() {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currIndex = value;
          });
        },
        iconSize: 26,
        currentIndex: currIndex,
        showSelectedLabels: false,
        enableFeedback: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_fill), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: screens[currIndex],
        bottomNavigationBar: customBottomNavBar());
  }
}
