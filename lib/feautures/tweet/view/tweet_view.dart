import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/loading.dart';
import 'package:twitter/common/round_button.dart';
import 'package:twitter/feautures/auth/controller/auth_controller.dart';
import 'package:twitter/theme/theme.dart';

class TweetView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const TweetView());
  const TweetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TweetViewState();
}

class _TweetViewState extends ConsumerState<TweetView> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          RoundedButton(
            onTap: () {},
            text: 'tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.profilePics),
                    )
                  ],
                )
              ]),
            )),
    );
  }
}
