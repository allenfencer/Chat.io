import 'package:chat_io/pages/auth/login_screen.dart';
import 'package:chat_io/pages/auth/phone_number_screen.dart';
import 'package:chat_io/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 260,
              width: 240,
              child: Image.asset(
                'assets/landing_asset.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              AppString.landingPageString,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
                buttonText: 'Start Messaging',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
