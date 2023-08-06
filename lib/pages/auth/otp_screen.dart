import 'package:chat_io/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_io/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../constants/strings.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();


  late final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: Theme.of(context).textTheme.headlineMedium,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  late final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColor.primaryColor),
    borderRadius: BorderRadius.circular(8),
  );

  late final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: AppColor.greyShade,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Enter Code',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${AppString.otpDesc} ${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              controller: otpController,
              length: 6,
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '123456' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
            ),
            const Spacer(),
            CustomButton(buttonText: 'Continue', function: () {}),
            const SizedBox(
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
