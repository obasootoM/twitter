import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/common/loading.dart';
import 'package:twitter/constant/constant_bar.dart';
import 'package:twitter/feautures/auth/controller/auth_controller.dart';
import 'package:twitter/feautures/auth/view/signup_view.dart';
import 'package:twitter/feautures/auth/widget/auth_textField.dart';
import 'package:twitter/theme/theme.dart';

class Loginview extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Loginview());
  const Loginview({super.key});

  @override
  ConsumerState<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends ConsumerState<Loginview> {
  final appbars = ConstantBar.appBar();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void login() {
    ref
        .read(authControllerProvider.notifier)
        .login(email: email.text, 
        password: password.text, 
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
              AuthTextField(
                controller: email,
                hintext: 'email',
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextField(
                controller: password,
                hintext: 'password',
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: RoundedButton(onTap: login, text: 'Done')),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(
                          fontSize: 16, color: Pallete.whiteColor),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, SignUpView.route());
                          },
                        text: 'Sign up',
                        style: const TextStyle(
                            color: Pallete.blueColor, fontSize: 16))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
