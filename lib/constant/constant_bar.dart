import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constant/asset_constant.dart';
import 'package:twitter/theme/pallet.dart';

class ConstantBar {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        // ignore: deprecated_member_use
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottombar = [
     const Text('home'),
     const Text('search'),
     const Text('notification')
  ];
    
  
}
