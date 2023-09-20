import 'package:flutter/material.dart';
import 'package:twitter/constant/constant_bar.dart';
import 'package:twitter/feautures/tweet/view/tweet_view.dart';
import 'package:twitter/theme/pallet.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  void onchangePage(int index) {
    setState(() {
      _page = index;
    });
  }

  changeTweet() {
    Navigator.push(context, TweetView.route());
  }

  @override
  Widget build(BuildContext context) {
    final appbar = ConstantBar.appBar();
    return Scaffold(
      appBar: appbar,
      body: IndexedStack(index: _page, children: ConstantBar.bottombar),
      floatingActionButton: FloatingActionButton.small(
        onPressed: changeTweet,
        child: const Icon(
          (Icons.add),
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Pallete.backgroundColor,
        currentIndex: _page,
        onTap: onchangePage,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(_page == 0 ? Icons.home_filled : Icons.home),
              // icon: SvgPicture.asset(
              //   _page == 0 ?
              //   AssetsConstants.homeFilledIcon :
              //   AssetsConstants.homeOutlinedIcon),
              backgroundColor: Pallete.whiteColor),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.search_outlined),
              // icon: SvgPicture.asset(
              //   AssetsConstants.searchIcon),
              backgroundColor: Pallete.whiteColor),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(_page == 0
                  ? Icons.notifications_off_sharp
                  : Icons.notifications),
              // icon: SvgPicture.asset(
              //   _page == 0 ?
              //   AssetsConstants.notifFilledIcon :
              //   AssetsConstants.notifOutlinedIcon),
              backgroundColor: Pallete.blueColor)
        ],
      ),
    );
  }
}
