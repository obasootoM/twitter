import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constant/constant_bar.dart';
import 'package:twitter/feautures/auth/controller/auth_controller.dart';
import 'package:twitter/feautures/auth/view/login_view.dart';
import 'package:twitter/feautures/auth/widget/auth_textField.dart';
import 'package:twitter/theme/pallet.dart';

import '../../../common/common.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpView());
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbars = ConstantBar.appBar();
  // final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    // nameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  void signup() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailEditingController.text,
        password: passwordEditingController.text,
        context: context);
  }
  

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbars,
      body: isLoading ? const Loader() : Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // AuthTextField(
              //   controller: nameEditingController,
              //   hintext: 'name',
              // ),
              const SizedBox(
                height: 10,
              ),
              AuthTextField(
                controller: emailEditingController,
                hintext: 'email',
              ),
              const SizedBox(
                height: 10,
              ),
              AuthTextField(
                controller: passwordEditingController,
                hintext: 'password',
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: RoundedButton(onTap: signup, text: 'Done')),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(
                          fontSize: 16, color: Pallete.whiteColor),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, Loginview.route());
                          },
                        text: 'Login',
                        style:
                            TextStyle(color: Pallete.blueColor, fontSize: 16))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}


