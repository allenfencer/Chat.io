import 'package:chat_io/constants/colors.dart';
import 'package:chat_io/constants/strings.dart';
import 'package:chat_io/pages/auth/otp_screen.dart';
import 'package:chat_io/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  String? completeNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Enter your Phone Number',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              AppString.phoneAuthDesc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 50,
            ),
            IntlPhoneField(
              controller: phoneNumberController,
              style: Theme.of(context).textTheme.bodyMedium,
              keyboardType: TextInputType.phone,
              textAlignVertical: TextAlignVertical.center,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColor.greyShade),
              onChanged: (value) {
                completeNumber = value.completeNumber;
              },
            ),
            const Spacer(),
            CustomButton(
                buttonText: 'Continue',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTPScreen(
                                phoneNumber: completeNumber!,
                              )));
                }),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
