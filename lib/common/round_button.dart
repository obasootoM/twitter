import 'package:flutter/material.dart';
import 'package:twitter/theme/pallet.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
   final Color textColor;
  const RoundedButton({super.key, 
  required this.onTap, 
  required this.text,  
  this.backgroundColor = Pallete.whiteColor, 
  this.textColor = Pallete.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        backgroundColor: backgroundColor,
        label: Text(text, style: TextStyle(color: textColor),)),
    );
  }
}
