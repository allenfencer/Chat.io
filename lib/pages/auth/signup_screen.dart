import 'package:chat_io/constants/colors.dart';
import 'package:chat_io/constants/strings.dart';
import 'package:chat_io/pages/home/home_screen.dart';
import 'package:chat_io/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void signup() async {
    if (formKey.currentState!.validate()) {
      try {
        if (passwordController.text == confirmPasswordController.text) {
          setState(() {
            isLoading = true;
          });
          await AuthService().signupUser(
              userNameController.text.trim(),
              nameController.text.trim(),
              emailController.text.trim(),
              passwordController.text.trim(),
              confirmPasswordController.text.trim());
          if (!mounted) return;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => HomeScreen())),
              (route) => false);
          setState(() {
            isLoading = false;
          });
        }
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign up to Chat.io',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 50,
                ),
                InputField(
                  editingController: nameController,
                  hintText: 'Full Name',
                  textInputType: TextInputType.name,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Name cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  editingController: userNameController,
                  hintText: 'Username',
                  textInputType: TextInputType.name,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Name cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
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
                ),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  obscureText: true,
                  editingController: confirmPasswordController,
                  hintText: 'Confirm password',
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
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: CustomButton(
                    isLoading: isLoading,
                    buttonText: 'Sign up',
                    function: () {
                      signup();
                    },
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
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
                            MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
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
      ),
    );
  }
}
