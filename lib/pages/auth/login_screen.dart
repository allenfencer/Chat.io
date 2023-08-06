import 'dart:math';

import 'package:chat_io/constants/colors.dart';
import 'package:chat_io/constants/strings.dart';
import 'package:chat_io/pages/auth/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await AuthService().loginUser(
            emailController.text.trim(), passwordController.text.trim());
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => HomeScreen())),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Log in to Chat.io',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 70,
              ),
              InputField(
                  editingController: emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Email cannot be empty';
                    } else if (!RegExp(AppString.emailPattern)
                        .hasMatch(value)) {
                      return 'Invalid email format';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (val) {}),
              const SizedBox(
                height: 20,
              ),
              InputField(
                  obscureText: true,
                  editingController: passwordController,
                  hintText: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Password cannot be empty';
                    } else if (value.length < 8) {
                      return 'Password must be atleast 8 characters';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (val) {}),
              const SizedBox(
                height: 80,
              ),
              Center(
                  child: CustomButton(
                      isLoading: isLoading,
                      buttonText: 'Login',
                      function: login)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (ctx) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Signup',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.primaryLight,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
