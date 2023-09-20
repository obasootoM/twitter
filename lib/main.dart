import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/error_page.dart';
import 'package:twitter/common/loading.dart';
import 'package:twitter/feautures/auth/controller/auth_controller.dart';
import 'package:twitter/feautures/auth/view/signup_view.dart';
import 'package:twitter/feautures/home_screen/view/home_screen.dart';
import 'package:twitter/theme/appbar_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter',
      theme: AppTheme.theme,
      home: 
      ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if (user != null) {
              return const HomeView();
            }
            return const SignUpView();
          },
          error: (e, str) => ErrorPage(error: e.toString()),
          loading: () => const LoadingPage()),
    );
  }
}
